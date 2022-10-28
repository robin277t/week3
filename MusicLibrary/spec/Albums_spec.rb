$LOAD_PATH << "lib"
require 'Albums'
require 'pg'

RSpec.describe "what" do
    
    def reset_albums_table
        seed_sql = File.read('spec/reseeds_musiclib.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_tests' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_albums_table
    end

    it "test1, 'all' method which selects all" do
        albumrepo1 = AlbumRepo.new
        albums = albumrepo1.all
        expect(albums.length).to eq (13)
    end

    it "test2, 'findtop1' method which selects top 1 record" do
        albumrepo1 = AlbumRepo.new
        expect(albumrepo1.findtop1(3,1)).to eq (["Album for Robin FROM TAYLOR"])
    end

    it "test3, 'find' method which selects 2 records" do
        albumrepo1 = AlbumRepo.new
        expect(albumrepo1.find(3)).to eq (["Lover", "Folklore", "Album for Robin FROM TAYLOR"])
    end

end




  

