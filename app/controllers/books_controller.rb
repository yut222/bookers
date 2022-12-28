class BooksController < ApplicationController
  def new
    @book = Book.new
  end

# 投稿一覧
  def index
    @books = Book.all
    @book = Book.new
  end

# 編集機能
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end


  def create
      @book = Book.new(book_params)
   if @book.save
      redirect_to book_path(@book.id)
   else
      @books = Book.all
      render :index
   end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
      flash[:notice] = "Book was successfully destroyed."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

    private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
