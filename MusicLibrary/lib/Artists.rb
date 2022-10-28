require 'database_connection'

class Artist
    attr_accessor :id, :name, :genre
end


class ArtistRepo

    def all
        sql = 'select name from artists'
        results = DatabaseConnection.exec_params(sql,[])
        results.values
    end

    def find(artist_name)
        sql = 'select * from artists where name = $1'
        results = DatabaseConnection.exec_params(sql,[artist_name])
        fail "no records" unless results.ntuples >0
        results.values
    end

    def findtopX(artist_name,count)
        sql = 'select name, genre from artists where name = $1 order by title LIMIT $2'
        results = DatabaseConnection.exec_params(sql,[artist_id,count])
        fail "no records" unless results.ntuples >0
        artists= []
        results.each do |art|
            artist = Artist.new
            artist.id = art['id']
            artist.name = art['name']
            artist.genre = art['genre']
            artists << artist
          end
          artists
    end

end