class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    favorite = current_user.favorites.build(micropost_id: params[:micropost_id])
    favorite.save
    flash[:success] = "この投稿をお気に入りに登録しました"
    redirect_to microposts_path
  end

  def destroy
    favorite = Favorite.find_by(micropost_id: params[:micropost_id], user_id: current_user.id)
    favorite.destroy
    flash[:danger] = "この投稿のお気に入りを解除しました"
    redirect_to microposts_path
  end
end