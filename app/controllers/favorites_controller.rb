class FavoritesController < ApplicationController
  def create
    #favorite = current_user.favorites.create(picture_id: params[:picture_id])
    favorite = Favorite.create(user_id: current_user.id , picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.user.name}さんのPictureをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.user.name}さんのPictureをお気に入り解除しました"
  end

  def show
    @favorite_pictures = current_user.favorite_pictures
  end
end
