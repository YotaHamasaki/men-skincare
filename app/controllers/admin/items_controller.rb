class Admin::ItemsController < ApplicationController
  before_action :if_not_admin 
  
  def new
    @admin =  User.find(2)
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:success] = "商品を登録しました"
      redirect_to items_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render("admin/items/new")
     end
  end    
  
  def  edit
    @item = Item.find(params[:id])
  end
  
  def update
      @item = Item.find(params[:id])
    if @item.update(items_params)
      flash[:success] = "商品を編集しました"
      redirect_to item_path
    else
      flash[:danger] = "商品を編集できませんでした"
      render :edit
  end
end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "商品は削除されました"
    redirect_to("/items")
  end
    
    
  private
  
  def if_not_admin
    unless current_user.admin? 
    flash[:danger] = "このユーザーでは表示できません"
    redirect_back(fallback_location:items_path)
  end
end

 def items_params
    params.require(:item).permit(:name, :image, :maker, :category_name, :category_id)
    
  end

end