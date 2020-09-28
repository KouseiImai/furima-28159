class ProductsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
