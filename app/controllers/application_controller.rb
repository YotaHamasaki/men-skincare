class ApplicationController < ActionController::Base
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  #未ログインユーザーのトップページ以降へのアクセスを制限
  def authenticate_user
    if current_user == nil
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end
  
  #ログインユーザー本人かどうか検証
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to user_path
    end
  end
  
  #既にログインしているか検証
  def already_login
    if current_user
      flash[:success] = "すでにログインしています"
      redirect_to items_path
    end
  end
  
end