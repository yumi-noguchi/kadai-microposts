class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    favorite = current_user.favorites.create(micropost_id: params[:micropost_id])
    favorite.save
    flash[:success] = "この投稿をお気に入りに登録しました"
    redirect_to likes_user_path
  end

  def destroy
    @micropost = Micropost.find(micropost_id: params[:micropost_id])
    @micropost.unlike(current_user)
    flash[:danger] = "この投稿のお気に入りを解除しました"
    redirect_to user
  end
end