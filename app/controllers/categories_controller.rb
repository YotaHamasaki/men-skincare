class CategoriesController < ApplicationController
  def index
    @items = Item.where(category_id: params[:category_id]).page(params[:page]).per(12).search(params[:search])
    @categories = Category.all
  end

end
