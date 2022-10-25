require 'model_music'
require 'database_connection'

class AlbumRepo

    def all
        sql = 'select * from albums'
        results = DatabaseConnection.exec_params(sql,[])
        albums = []
        results.each do |record|
            album = Album.new
            album.id = record['id']
            album.title = record['title']
            album.release_year = record['release_year']
            album.artist_id = record['artist_id']
      
            albums << album
          end
          return albums
    end

end