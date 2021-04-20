class Admin::ItemsController < ApplicationController
  before_action :if_not_admin 
  
   def new
    @admin =  User.find(4)
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:success] = "登録に成功しました"
      redirect_to items_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render("admin/items/new")
     end
  end    

  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "商品は削除されました"
    redirect_to("/items")
  end
    

      
  private
  
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
  
  def if_not_admin
    unless current_user.admin? 
    flash[:danger] = "このユーザーでは表示できません"
    redirect_back(fallback_location:items_path)
  end
end

 def items_params
    params.require(:item).permit(:name, :image, :category_name)
    
  end
  

end