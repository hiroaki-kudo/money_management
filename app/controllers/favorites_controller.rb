class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorite_treasurers
    unless Management.exists?(kid_id: current_user.id)
      redirect_to treasurers_path, notice: "先にお父さんかお母さんに親子の設定をしてもらってね！"
    end
  end
  def create
    favorite = current_user.favorites.create(treasurer_id: params[:treasurer_id])
    redirect_to favorites_path, notice: "#{favorite.treasurer.user.name}さんの内容をお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to favorites_path, notice: "#{favorite.treasurer.user.name}さんの内容をお気に入り解除しました"
  end
end
