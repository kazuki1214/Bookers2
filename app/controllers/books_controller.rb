class BooksController < ApplicationController
  before_action :edit_params, only:[:edit]

  def index
    @books = Book.all
    @user = current_user
    @new_book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user =  current_user
    if @new_book.save
      flash[:created] = "You have created book successfully."
      redirect_to book_path(@new_book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.user = current_user
    if @book.update(book_params)
      flash[:update] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

end

private

def book_params
  params.require(:book).permit(:title,:body)
end

def edit_params
  book = Book.find(params[:id])
  if book.user != current_user
  else
    redirect_to books_path
  end
end