class ItemsController < ApplicationController
  
  before_action :authenticate_user
  
  def index
    @items = Item.all.page(params[:page]).per(10).search(params[:search])
    @categories = Category.all
    @item = Item.find_by(params[:id])
  
  end
  
  def show
    @item = Item.find(params[:id])
    @posts = @item.posts
  end

end