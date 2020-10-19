class PurchasesController < ApplicationController
  before_action :check_login_user

  def index
    binding.pry
    @product = Product.find(params[:product_id])
    @user_purchase=UserPurchase.new
  end
  
  def create
    @user_purchase=UserPurchase.new(user_purchase_params)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  
  private

  def check_login_user
    redirect_to new_user_session_path unless user_signed_in?
  end

  def user_purchase_params
    params.require(:user_purchase).permit(:product_id, :purchase_id, :postal_code, :prefecture_id, :municipal, :address, :building_name, :phone_number).merge(user_id: current_user.id).merge(product_id: params[:product_id]).merge(token: params[:token], price: params[:price])
  end

  def pay_item
    Payjp.api_key=ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: user_purchase_params[:price],
      card: user_purchase_params[:token],
      currency: 'jpy'
    )
  end
end
