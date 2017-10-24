class BooksController < ApplicationController
  def index
    #IDEA instance variable lets us grab the object
    @books = Book.all
    render :index
  end


  #TODO Use redirect in show method to go back to index b/c encapsulation
  # One redirect per method
  def show
    @book = Book.find_by(id: params[:id])
    # render json: @book

    if @book
      render :show
    else
      redirect_to books_url
    end
  end



  # def new
  #   render :new
  # end
  #
  # def create
  #   book = Book.new(book_params) # Creates new Book object with params passed-in
  #   #TODO Ask a TA question -- what is going on here? (Adapted from solutions)
  #   if book.save
  #     redirect_to books_url
  #   else
  #     flash.now[:errors] = book.errors.full_messages
  #     render :new
  #   end
  # end
  #
  # def destroy
  #   book = Book.find_by(params[:id])
  #   book.destroy
  #   redirect_to books_url
  # end

  # private

  # def book_params
  #   params.require(:book).permit(:title, :author)
  # end
end
