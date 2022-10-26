$LOAD_PATH << "lib"
require 'database_connection'
require 'book_store'

DatabaseConnection.connect('book_store')

booktest1 = BooksRepo.new
puts booktest1.all_titles


