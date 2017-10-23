class BooksController < ApplicationController
  def index
    # your code here

    @books = Book.all
    render :index
  end

  def new
    # your code here
  end

  def create
    # your code here
  end

  def destroy
    # your code here
    book = Book.find_by(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
