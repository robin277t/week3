1 - setup of project DONE
2 - createDB and import SQL seed DONE
3 - Define class names for Model and Repository (use one file) DONE
4 - Implement Model class using attributes (attr_accessor :x,:y) DONE
5 - Define Repository class interface (methods - what they do and arguments) DONE
6 - Write up the SQL commands for the above DONE
7 - Create some shorthand tests we expect DONE
8 - Add reload SQL seed to RSpec file DONE
9 - Test drive to write the Repo class. DONE
10 - Write app.rb to run not just through tests


Tests:

1 expect all_titles to return [1984, miss dalloway, emma, dracula, the age of innocence]
2 expect info_by_author to return [4=>Dracula=>Bram Stoker, 5=>The age of innocence => edith wharton, 1=>1984=> George Orwell etc]
3 expect find_books_by_author(Jane Austen) to return "Emma"