require 'repo_music'
require 'pg'
require 'database_connection'
DatabaseConnection.connect('music_library')
#require 'spec/seeds_albums.sql'

RSpec.describe "what" do
    
  #  def reset_albums_table
  #      seed_sql = File.read('spec/seeds_albums.sql')
  #      connection = PG.connect({ host: '127.0.0.1', dbname: music_library })
  #      connection.exec(seed_sql)
  #  end

    #before(:each) do 
    #    reset_albums_table
    ## THIS DOESN'T WORK - GOT FROM TIM
    #end

    it "test1" do
        albumrepo1 = AlbumRepo.new
        albums = albumrepo1.all
        expect(albums.length).to eq (11)
    end

end


### Make sure the reset function in the test works properly
### with the correct data

### 1 Ask Leo why you need to add DB connection in spec_helper
### rather than just in the regular spec file?

### 2 Also ask Leo why class DatabaseConnection is different;
### A - self.connect appears to be like an initialize? any differences?
### B - in self.exex_params, appears to update the instance variable 
### @connection with the method that the command is already inside?


  

