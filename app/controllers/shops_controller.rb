class ShopsController < ApplicationController
  def index
  	@shops = Shop.search(params[:search]) #検索機能
  end

  def show
  	@shop = Shop.find(params[:id])
  	@post_comment = PostComment.new  #コメント機能
  	@favorite = Favorite.new #お気に入り
  end

  def new
  	@shop = Shop.new
  end

  def create
  	@shop = Shop.new(shop_params)
  	@shop.user_id = current_user.id
  	@shop.save
  	redirect_to shops_path
  end

  def edit
  	@shop = Shop.find(params[:id])
  end

  def update
  	@shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to shop_path(@shop.id)
  end

  def destroy
  	@shop = Shop.find(params[:id])
	@shop.destroy
	redirect_to shops_path
  end

  private

  def shop_params
  			params.require(:shop).permit(:shop_name,
  										 :introduction,
  										 :first_menu,
  										 :first_price,
  										 :second_menu,
  										 :second_price,
  										 :start_time,
  										 :last_time,
  										 :holiday,
  										 :address,
  										 :phone_number,
  										 :shop_image,
  										 :user_id,
  										 :search
  										 )
  end



end
