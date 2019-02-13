class Library

  attr_reader :books

  def initialize()
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    book_in_library = false
    if @books.length >= 1
      @books.each do |book|
        book_in_library = true if book.title == title
      end
    end
    book_in_library
  end

  def card_catalogue
    @books.sort_by { |book| book.author_last_name }
  end

  def find_by_author(author_full_name)
    books_by_author = @books.select do |book|
      "#{book.author_first_name} #{book.author_last_name}" == author_full_name
    end

    sort_selected_books_into_hash(books_by_author)
  end

  def find_by_publication_date(year)
    books_by_year = @books.select do |book|
      book.publication_date == year
    end

    sort_selected_books_into_hash(books_by_year)
  end

  def sort_selected_books_into_hash(selected_books)
    selected_books = selected_books.group_by(&:title)

    selected_books.each do |book_title, book_array|
      selected_books[book_title] = book_array[0]
    end

    selected_books
  end
end
