class UsersController < ApplicationController
  
  before_action :authenticate_user, only: [:show]
  before_action :already_login, only: [:new]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "新規登録に成功しました"
        redirect_to login_path
      else
        flash[:danger] = "新規登録に失敗しました"
        render action: :new
      end
  end

  def show
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
