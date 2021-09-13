class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user

  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if  @book.save
        flash[:success] = "You have created book successfully."
        redirect_to book_path(@book.id)
    else
      flash.now[:danger] = ""

      @books = Book.all
      @user = current_user
      render :index
    end
  end



  def show
    @book = Book.find(params[:id])
    @user =@book.user
    @book_new = Book.new


  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      render :edit
    else
      redirect_to books_path
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
        redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      flash.now[:alert] = ""

      @books = Book.all
      render :edit
    end

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end