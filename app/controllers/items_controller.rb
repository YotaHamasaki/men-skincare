class ItemsController < ApplicationController
  
  before_action :authenticate_user
  
  def index
    @items = Item.all.page(params[:page]).per(10)
    @categories = Category.all
    @item = Item.find_by(params[:id])
    @posts = @item.posts
    
  end
  
  def show
    @item = Item.find(params[:id])
    @posts = @item.posts
  end

end