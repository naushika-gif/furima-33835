class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]

  def index  
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
       @product.save
      redirect_to root_path      
    else
      render :new
    end
  end

  def show
  end

  def edit 
      redirect_to root_path if current_user.id != @product.user_id || @product.purchase != nil
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private 
  
  def product_params
    params.require(:product).permit(:name, :explanation, :category_id, :condition_id, :delivery_cost_id, :delivery_from_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
