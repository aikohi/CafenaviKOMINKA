class UsersController < ApplicationController
  def show
  	 @user = User.find(params[:id])
     @shops = Shop.where(user_id: params[:id])
  end

  def edit
  	 @user = User.find(params[:id])
     @shop = Shop.find(params[:id])
  end
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private
def user_params
    params.require(:user).permit(:name, :profile_image)
end

