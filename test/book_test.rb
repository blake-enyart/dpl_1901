require './test/test_helper'

class BookTest < Minitest::Test

  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_it_exist

    assert_instance_of Book, @book
  end

  def test_attributes_return_correctly

    assert_equal "Harper", @book.author_first_name
    assert_equal "Lee", @book.author_last_name
    assert_equal "To Kill a Mockingbird", @book.title
    assert_equal "1960", @book.publication_date
  end

end
