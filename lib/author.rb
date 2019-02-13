class Author

  attr_reader :first_name, :last_name, :books

  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
    @books = []
  end

  def add_book(title, publication_date)
    book = Book.new(author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date)
    @books << book
    book
  end
end
