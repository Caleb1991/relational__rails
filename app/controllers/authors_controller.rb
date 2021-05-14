class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def show_authors_with_books
    @author = Author.find(params[:id])
    @books = Book.all.where(author: @author)
  end

  def book_count
    @author = Author.find(params[:id])
    @books = Book.all.where(author: @author)
    @books.count
  end
end