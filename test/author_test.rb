require './test/test_helper'

class AuthorTest < Minitest::Test

  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
  end

  def test_it_exist

    assert_instance_of Author, @nk_jemisin
  end

  def test_attributes_return_correctly
    expected = []

    assert_equal expected, @nk_jemisin.books
  end

  def test_add_book_adds_book_obect_to_books_array
    expected = []

    assert_equal expected, @nk_jemisin.books

    @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")

    assert_instance_of Book, @nk_jemisin.books[0]
    assert_equal "The Fifth Season", @nk_jemisin.books[0].title
    assert_equal "2015", @nk_jemisin.books[0].publication_date

    @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    assert_instance_of Book, @nk_jemisin.books[1]
    assert_equal "The Hundred Thousand Kingdoms", @nk_jemisin.books[1].title
    assert_equal "2010", @nk_jemisin.books[1].publication_date
  end
end
