class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorite_treasurers
  end
  def create
    favorite = current_user.favorites.create(treasurer_id: params[:treasurer_id])
    redirect_to treasurers_path, notice: "#{favorite.treasurer.user.name}さんの収支をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to treasurers_path, notice: "#{favorite.treasurer.user.name}さんの収支をお気に入り解除しました"
  end
end
