class PostsController < ApplicationController
  
  def new
    @post = Post.new
    @item = Item.find(params[:item_id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "レビューを投稿しました"
      redirect_to item_path(id: @post.item_id)
    else
      flash.now[:danger] = "投稿に失敗しました"
      render("posts/new")
    end
  end

  def edit
    @user = User.find(params[:id])
    @post = @user.posts
    
    
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿を編集しました"
      redirect_to items_path
    else
      flash[:danger] = "投稿を編集できませんでした"
      render("posts/edit")
    end
    
  end
  
  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to user_path
  end
  

  private
  
  def post_params
    params.require(:post).permit(:rate, :title, :content)
    .merge(user_id: current_user.id,item_id: params[:item_id])
  end

end
