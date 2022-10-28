require 'database_connection'


class Album
    attr_accessor :id, :title, :release_year, :artist_id
end


class AlbumRepo

    def all
        sql = 'select * from albums'
        results = DatabaseConnection.exec_params(sql,[])
        albumstitles = []
        results.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']
            albumstitles << album.title
          end
          albumstitles
    end

    def find(artist_id)
        sql = 'select title from albums where artist_id = $1'
        results = DatabaseConnection.exec_params(sql,[artist_id])
        albums = []
        results.each do |record|
            album = Album.new
            album.title = record['title']
            albums << album.title
          end
          albums
    end

    def findtop1(artist_id,count)
        sql = 'select title from albums where artist_id = $1 order by title LIMIT $2'
        results = DatabaseConnection.exec_params(sql,[artist_id,count])
        albums = []
        results.each do |record|
            album = Album.new
            album.title = record['title']
            albums << album.title
          end
          albums
    end

end