class Author < ApplicationRecord
  has_many :books

    def book_count
    books.count
  end
end