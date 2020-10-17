class PurchasesController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @user_purchase=UserPurchase.new
  end
  
  def create
    @user_purchase=UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:product_id, :purchase_id, :postal_code, :prefecture_id, :municipal, :address, :building_name, :phone_number).merge(user_id: current_user.id).merge(product_id: params[:product_id])
  end
end
