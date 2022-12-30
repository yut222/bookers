class BooksController < ApplicationController
# bookの新規登録機能
  def new
    @book = Book.new
  end

# 投稿一覧
  def index
    @books = Book.all  #bookテーブルの全情報を取得して、@books(複数形)に格納
    @book = Book.new
  end

# 詳細画面
  def show
    @book = Book.find(params[:id])  #bookテーブルから1つずつ取得したデータを、@book(単数形)に格納
  end

# 編集
  def edit
    @book = Book.find(params[:id])  #bookテーブルから1つずつ取得したデータを、@book(単数形)に格納
  end

# bookの新規登録に保存機能を追記
  def create
      @book = Book.new(book_params)  #データを受け取り新規登録するためのインスタンス作成(Book.new),表示レコードを変える(params)
    if @book.save  # saveメソッドで対象カラムにデータが入力されている場合true(showへリダイレクト),入力されていない場合false(indexを再表示する)
      flash[:notice] = "Book was successfully created."  # 保存用フラッシュメッセージ
      redirect_to book_path(@book.id)  # book(Prefix)_path(@book(上記Book.newで@book格納してるから？).id),showへリダイレクト
    else
      @books = Book.all  #すべてのリストを取り出すから、@books複数形にした,renderの直前に必要なインスタンス変数(@books)を定義する
      render :index  # render :アクション名で、同じコントローラ内の別アクションのViewを表示。@book=Book.newでListモデルの新規登録に失敗したときにrenderされるviewは
    end
  end

  def update
    @book = Book.find(params[:id])
   if  @book.update(book_params)
    flash[:notice] = "Book was successfully updated."  # アップデート用フラッシュメッセージ
    redirect_to book_path(@book.id)  # book(Prefix)_path(@book(上記Book.findで@book格納してるから？).id)
   else
     render :edit
   end
  end


  def destroy
    book = Book.find(params[:id])  # データ(レコード)を1件取得
    book.destroy  # データ(レコード)を削除
    flash[:notice] = "Book was successfully destroyed."  # 削除用フラッシュメッセージ
    redirect_to '/books'  #一覧画面(index)へリダイレクトする
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
