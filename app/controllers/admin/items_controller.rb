class Admin::ItemsController < ApplicationController
  before_action :not_admin
   def new
    @item = Item.new 
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:success] = "登録に成功しました"
      redirect_to("/items")
    else
      flash.now[:danger] = "登録に失敗しました"
      render("items/new")
     end
  end    
  
  def show
    @item = Item.find(params[:id])
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "商品は削除されました"
    redirect_to("/items")
  end
    
  end
      
  private
  
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
  
  def not_admin
    unless current_user.admin? 
    redirect_to("/items")
    end
  end