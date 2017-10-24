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

  def new
    # NO params
    @book = Book.new
    render :new
  end

  def create
    # create, then save!
    @book = Book.new(book_params)
    # params = { book: {title: 'The Subtle...'}}

    if @book.save
      # show user
      # Rails will automatically picku ID from @books
      redirect_to book_url(@book)
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
    render :edit
  end

  def update
    @book = Book.find_by(id: params[:id])

    if @book.update_attributes(book_params)
      # show user
      # Rails will automatically pickup ID from @books
      redirect_to book_url(@book)
    else
      flash.now[:errors] = book.errors.full_messages
      render :edit
    end
  end

  #
  # def destroy
  #   book = Book.find_by(params[:id])
  #   book.destroy
  #   redirect_to books_url
  # end

  private

  def book_params
    params.require(:book).permit(:title, :author, :year, :category, :description)
  end
end
