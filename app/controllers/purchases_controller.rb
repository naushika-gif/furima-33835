class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  # 購入ページに行く前にログインしているユーザーかどうかを確認している
  # 遷移に関することはコントローラーで定義する

  def index
  @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(purchase_params)
    if @buyer_address.valid?
      pay_item
       @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:buyer_address).permit(:postal_code, :delivery_from_id, :city, :house_number, :building_name, :telephone_no).merge(user_id: current_user.id, product_id: params[:product_id, :price])
  end

  def set_purchase
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @product.user_id || @product.purchase != nil
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       token: purchase_params[:token],
       price: purchase_params[:price]
       currency:'jpy'
    )
  end
end

# 購入機能
# controller→model→view
# <controller>
# viewで入力し購入機能を押すことでcreateアクションが動く
# createアクションが動くことによってpurchase_paramsメソッドが働き、その中で許可された情報を@buyer_addressに渡す
# require= どこの配列 permit=何の情報か merge= 紐尽かせる情報は何か
# <model>
# ストロングパラメーターで許可した情報をformオブジェクトへ@buyer_addressを通して渡す
# attr_accessorで許可された情報を受け取る (そこにバリデーションをかけることで制限させる)
#<view>
# バリデーションを通した情報をform内に保存させ、トップページを表示させる