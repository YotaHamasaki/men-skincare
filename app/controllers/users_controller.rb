class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "新規登録に成功しました"
        redirect_to("/login")
      else
        flash[:danger] = "登録に失敗しました"
        render("users/new")
      end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])

  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
  end
  
end
