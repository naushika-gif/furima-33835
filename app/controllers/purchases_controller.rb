class PurchasesController < ApplicationController
  def create
    purchase = Purchase.create(purchase_params)
    redirect_to "/products/#{purchase.product.id}"
  end

  private
  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, product_id: params[:product_id])
end
