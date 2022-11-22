require "book_repository"

def reset_students_table
  seed_sql = File.read("spec/seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "book_store" })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do
    reset_students_table
  end

    it "Gets values of the first book in the array" do
      booklist = BookRepository.new
      books = booklist.all
      expect(books[0].title).to eq "Nineteen Eighty-Four"
      expect(books[0].author_name).to eq "George Orwell"
      expect(books[0].id).to eq "1"
    end

    it "Gets values of the third book in the array" do
        booklist = BookRepository.new
        books = booklist.all
        expect(books[2].title).to eq "Emma"
        expect(books[2].author_name).to eq "Jane Austen"
        expect(books[2].id).to eq "3"
      end

  end

