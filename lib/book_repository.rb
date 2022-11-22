require_relative './book'
class BookRepository

  def all
    books = []
    sql = "SELECT id, title, author_name FROM books;"
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |book| 
        book_choice = Book.new
        book_choice.id = book['id']
        book_choice.title = book['title']
        book_choice.author_name = book['author_name']

        books << book_choice

    end 
    return books
  end
end
