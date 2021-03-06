class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
    book = Book.new(book_params) # Creates new Book object with params passed-in
    #TODO Ask a TA question -- what is going on here? (Adapted from solutions)
    if book.save
      redirect_to books_url
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
  end

  def destroy
    book = Book.find_by(params[:id])
    book.destroy
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
