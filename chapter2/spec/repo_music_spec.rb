require 'repo_music'
#require 'spec/seeds_albums.sql'
require 'pg'

RSpec.describe "what" do
    
    def reset_albums_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: music_library })
        connection.exec(seed_sql)
    end

    #before(:each) do 
    #    reset_albums_table
    #end

    it "test1" do
        albumrepo1 = AlbumRepo.new
        albums = albumrepo1.all
        expect(albums.length).to eq (11)
    end

end


  

