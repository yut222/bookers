class BooksController < ApplicationController
# bookの新規登録機能
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

# bookの新規登録に保存機能を追記
  def create
      @book = Book.new(book_params) #データを受け取り新規登録するためのインスタンス作成(Book.new)
    if @book.save  #データをデータベースに保存するためのsaveメソッド実行
      flash[:notice] = "Book was successfully created."  # 保存用フラッシュメッセージ
      redirect_to book_path(@book.id)
    else
      @books = Book.all  #すべてのリストを取り出すから、@books複数形にした
      render :index  # render :アクション名で、同じコントローラ内の別アクションのViewを表示
    end
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(book_params)
    flash[:notice] = "Book was successfully updated."  # アップデート用フラッシュメッセージ
    redirect_to book_path(@book.id)  #showページにリダイレクトする
   else
     render :edit
   end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."  # 削除用フラッシュメッセージ
    redirect_to '/books'  #一覧画面へリダイレクトする
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
