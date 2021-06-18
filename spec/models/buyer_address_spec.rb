require 'rails_helper'
RSpec.describe BuyerAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, product_id: @product.id)
    sleep 0.1
  end

  describe '配送先住所の保存' do
    context "配送先住所のデータが保存できるとき" do
      it "全ての項目の入力が存在できていれば登録できる" do
      expect(@buyer_address).to be_valid
      end
      it "建物名が存在していなくても登録できる" do
      @buyer_address.building_name = ''
      expect(@buyer_address).to be_valid
      end
    end
    context '配送先住所のデータが保存できないとき' do
     it 'postal_codeが空では登録できない' do
      @buyer_address.postal_code = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと登録できない' do
      @buyer_address.postal_code = '0000000'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'delivery_from_idが選択されていないと登録できない' do
      @buyer_address.delivery_from_id = 0
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Delivery from can't be blank")
    end
    it 'cityが空では登録できない' do
      @buyer_address.city = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空では登録できない' do
      @buyer_address.house_number = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephone_noが空では登録できない' do
      @buyer_address.telephone_no = ''
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Telephone no can't be blank")
    end
    it 'telephone_noは11桁以上は登録できない' do
      @buyer_address.telephone_no = '000000000000'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Telephone no is invalid")
    end
    it 'telephone_noは文字列では登録できない' do
      @buyer_address.telephone_no = 'あああああああ'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Telephone no is invalid")
    end
    it 'telephone_noは英数混合では登録できない' do
      @buyer_address.telephone_no = '0801234abcd'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Telephone no is invalid")
    end

    it 'tokenの値がnilの場合購入できない' do
      @buyer_address.token = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'userの値がnilの場合購入できない' do 
      @buyer_address.user_id = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("User can't be blank")
    end
    it 'productの値がnilの場合購入できない' do
    @buyer_address.product_id = nil
    @buyer_address.valid?
    expect(@buyer_address.errors.full_messages).to include("Product can't be blank")
    end
   end
  end
end