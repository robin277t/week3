$LOAD_PATH << "lib"
require 'Albums'
require 'Artists'
require_relative '../app'
require 'pg'

RSpec.describe "what" do

    it "doubles of the io, first case albums" do
        kernaldoub = double :whatever
        expect(kernaldoub).to receive(:puts).with("Welcome to the music library manager!\nWhat would you like to do?\n"\
            "   1 - List all albums\n   2 - List all artists\nEnter your choice:")
        expect(kernaldoub).to receive(:gets).and_return("1")
        expect(kernaldoub).to receive(:puts).with("Here is the list of albums:\n * Doolittle\n * Surfer Rosa\n"\
             " * Waterloo\n * Super Trouper\n * Bossanova\n * Lover\n * Folklore\n * I Put a Spell on You\n"\
             " * Baltimore\n * Here Comes the Sun\n * Fodder on My Wings\n * Album for Robin FROM TAYLOR\n * Ring Ring")
        app = Application.new('music_library', kernaldoub, AlbumRepo.new, ArtistRepo.new)    
        app.run
    end

    it "doubles of the io, second case artists" do
        kernaldoub = double :whatever
        expect(kernaldoub).to receive(:puts).with("Welcome to the music library manager!\nWhat would you like to do?\n"\
            "   1 - List all albums\n   2 - List all artists\nEnter your choice:")
        expect(kernaldoub).to receive(:gets).and_return("2")
        expect(kernaldoub).to receive(:puts).with("Here is the list of artists:\n * Pixies\n * ABBA\n * Taylor Swift\n * Nina Simone")
        app = Application.new('music_library', kernaldoub, AlbumRepo.new, ArtistRepo.new)    
        app.run

    end

end