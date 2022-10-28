$LOAD_PATH << "lib"
require 'Albums'
require 'Artists'

class Application

      # The Application class initializer
      # takes four arguments:
      #  * The database name to call `DatabaseConnection.connect`
      #  * the Kernel object as `io` (so we can mock the IO in our tests)
      #  * the AlbumRepository object (or a double of it)
      #  * the ArtistRepository object (or a double of it)

  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
              # "Runs" the terminal application
              # so it can ask the user to enter some input
              # and then decide to run the appropriate action
              # or behaviour.

              # Use `@io.puts` or `@io.gets` to
              # write output and ask for user input.

    @io.puts "Welcome to the music library manager!\nWhat would you like to do?\n   1 - List all albums\n"\
    "   2 - List all artists\nEnter your choice:"
    choice = @io.gets.chomp.to_i
    if choice == 1 
      @io.puts "Here is the list of albums:\n * #{@album_repository.all.join("\n * ")}"
    elsif choice == 2
      @io.puts "Here is the list of artists:\n * #{@artist_repository.all.join("\n * ")}"
    else
      @io.puts "invalid choice"
    end
  end
end

          # Don't worry too much about this if statement. It is basically saying "only
          # run the following code if this is the main file being run, instead of having
          # been required or loaded by another file.
          # If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepo.new,
    ArtistRepo.new
  )
  app.run
end
