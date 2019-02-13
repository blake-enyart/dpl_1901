class Book

  attr_reader :author_first_name, :author_last_name, :title, :publication_date

  def initialize(author_first_name:, author_last_name:, title:, publication_date:)
    @author_first_name = author_first_name
    @author_last_name = author_last_name
    @title = title
    @publication_date = publication_date[-4..-1]
  end
end
