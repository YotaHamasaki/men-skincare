class SessionsController < ApplicationController
    
    before_action :already_login, only: [:new]
    
    def new
    end
    
    def create
       email = params[:session][:email].downcase
        password = params[:session][:password]
        if login(email, password)
          flash[:success] = "ログインに成功しました"
          redirect_to items_path
        else
            flash.now[:danger] = "メールアドレスもしくはパスワードが違います"
            render :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "ログアウトに成功しました"
        redirect_to root_path
    end
    
    def login(email, password)
        @user = User.find_by(email: email)
        if @user && @user.authenticate(password)
          session[:user_id] = @user.id
          return true
        else
          return false
        end
      end
    
end
