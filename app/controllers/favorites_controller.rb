class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = "この投稿をお気に入りに登録しました"
    redirect_to likes_user_path(micropost.id)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:danger] = "この投稿のお気に入りを解除しました"
    redirect_to likes_user_path(micropost.id)
  end
end