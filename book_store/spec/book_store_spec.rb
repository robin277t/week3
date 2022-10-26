require 'book_store'
require 'pg'

RSpec.describe BooksRepo do

    def reset_books_table
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_books_table
    end


#1 expect all_titles to return [1984, miss dalloway, emma, dracula, the age of innocence]
#2 expect info_by_author to return [4=>Dracula=>Bram Stoker, 5=>The age of innocence => edith wharton, 1=>1984=> George Orwell etc]
#3 expect find_books_by_author(Jane Austen) to return "Emma"

    it "test1 - all_titles to return correctly" do
        books = BooksRepo.new
        showbooks = books.all_titles
        expect(showbooks.length).to eq 5 # assuming an array is output 
        expect(showbooks).to eq ['Nineteen Eighty-Four','Mrs Dalloway','Emma', 'Dracula', 'The Age of Innocence']
    end

    it "test 2 - info_by_author to return correctly" do
        books = BooksRepo.new
        expect(books.info_by_author).to eq ["Dracula by Bram Stoker", "The Age of Innocence by Edith Wharton", "Nineteen Eighty-Four by George Orwell",
             "Emma by Jane Austen", "Mrs Dalloway by Virginia Woolf"]
    end

    it "test 3 - find_books_by_author(Jane Austen)" do
        books = BooksRepo.new
        expect(books.find_books_by_author("George Orwell")).to eq "Nineteen Eighty-Four"
    end


end

