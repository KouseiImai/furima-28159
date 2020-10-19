class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_product_information, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.update(product_params)
      redirect_to user_product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def selling_price_calc
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id,
                                    :shipping_charge_id, :shipping_area_id, :shipping_day_id,
                                    :price).merge(user_id: current_user.id)
  end

  def set_product_information
    @product = Product.find(params[:id])
  end
end
