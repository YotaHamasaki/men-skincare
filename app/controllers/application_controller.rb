class ApplicationController < ActionController::Base
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  def authenticate_user
    if current_user == nil
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end
  
  def already_login
    if current_user
      flash[:success] = "すでにログインしています"
      redirect_to items_path
    end
  end
  
end