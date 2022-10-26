$LOAD_PATH << 'lib'
require 'database_connection'
require 'lib/repo_music'

DatabaseConnection.connect('music_library')

records = AlbumRepo.new

puts records.find
puts records.findtop1

