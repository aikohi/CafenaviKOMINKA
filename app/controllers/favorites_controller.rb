class FavoritesController < ApplicationController
  def index
  	@favorites = Favorite.all
  end

  def create
  	user = current_user
  	shop = Shop.find(params[:shop_id])
    Favorite.create(user_id: user.id,shop_id:shop.id)
    redirect_to shops_path
  end

  def destroy
  	user = current_user
  	shop = Shop.find(params[:shop_id])
    favorite = Favorite.find_by(user_id: user.id,shop_id:shop.id)
    favorite.delete
    redirect_to user_favorites_path(current_user)
  end

end
