class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :move_to_index, only: [:edit]

  
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
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private 
  
  def product_params
    params.require(:product).permit(:name, :explanation, :category_id, :condition_id, :delivery_cost_id, :delivery_from_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless current_user == @product.user.id
      redirect_to action: :index
    end
  end
end
