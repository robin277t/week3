require 'database_connection'

class Book
    attr_accessor :id, :title, :author_name
end

class BooksRepo

    def all_titles
        sql = 'select title from books'
        results = DatabaseConnection.exec_params(sql,[])
        array = []
            results.each do |booktitle|
                book = Book.new
                book.title = booktitle['title']
                array.push(book.title)
            end
        return array
    end

    def info_by_author
        sql = 'select * from books order by author_name'
        results = DatabaseConnection.exec_params(sql,[])
        array = []
        results.each do |booktitle|
            book = Book.new
            book.title = booktitle['title']
            book.author_name = booktitle ['author_name']
            x = "#{book.title} by #{book.author_name}"
            array.push(x)
        end
        return array
    end

    def find_books_by_author(author)
        sql = "select title from books where author_name = $1"
        results = DatabaseConnection.exec_params(sql,[author])
        output = ""
        results.each do |booktitle|
            book = Book.new
            book.title = booktitle['title']
            output = book.title
        end
        output

    end

end