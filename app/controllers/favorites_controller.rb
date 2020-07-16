class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.favorite(current_user)
    flash[:success] = "この投稿をお気に入りに登録しました"
    redirect_to user
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.unlike(current_user)
    flash[:danger] = "この投稿のお気に入りを解除しました"
    redirect_to user
  end
end