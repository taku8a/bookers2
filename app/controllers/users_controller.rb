class UsersController < ApplicationController
  def show

    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
     @user = current_user
     @book = Book.new

     @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
        redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      flash.now[:alert] = ""


      @users = User.all
      render :edit
    end

  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end

  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end




end
