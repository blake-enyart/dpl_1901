require './test/test_helper'

class LibraryTest < Minitest::Test

  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @dpl = Library.new
  end

  def test_it_exist

    assert_instance_of Library, @dpl
  end

  def test_books_array_empty
    expected = []

    assert_equal expected, @dpl.books
  end

  def test_add_to_collection_stores_book_objects_in_books_array
    expected = []

    assert_equal expected, @dpl.books

    @dpl.add_to_collection(@fifth_season)
    expected = [@fifth_season]

    assert_equal expected, @dpl.books

    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    expected = [@fifth_season, @mockingbird, @kingdoms]

    assert_equal expected, @dpl.books
  end

  def test_include_returns_boolean_based_on_book_title_in_collection
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)

    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_card_catalogue_organizes_books_by_authors_last_name
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    expected = [@fifth_season, @kingdoms, @mockingbird]

    assert_equal expected, @dpl.card_catalogue
  end

  def test_find_by_author_make_hash_of_books_by_same_author
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    expected = { "The Fifth Season" => @fifth_season, 'The Hundred Thousand Kingdoms' => @kingdoms }

    assert_equal expected, @dpl.find_by_author("N.K. Jemisin")
  end

  def test_find_by_publication_date_finds_books_based_on_date
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    expected = { "To Kill a Mockingbird" => @mockingbird }

    assert_equal expected, @dpl.find_by_publication_date("1960")
  end

end
