class ItemsController < ApplicationController
  
  before_action :authenticate_user
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
    @posts = @item.posts
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
  
  private
  
  def items_params
    params.require(:item).permit(:name, :image)
  end
  
end
