require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品する商品の保存' do
    context "出品する商品のデータが保存できるとき" do
      it '全ての項目の入力が存在されていれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '出品する商品のデータが保存できないとき' do
     it 'imageが添付されていないと登録できない' do
      if @product.image.attached?
      else
      @product.valid?
      end
     end
     it 'nameが空では登録できない' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
     end
     it 'explanationが空では登録できない' do
      @product.explanation = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'category_idが選択されていないと登録できない' do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")
    end
    it 'condition_idが選択されていないと登録できない' do
      @product.condition_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition must be other than 1")
    end
    it 'delivery_cost_idが選択されていないと登録できない' do
      @product.delivery_cost_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery cost must be other than 1")
    end
    it 'delivery_from_idが選択されていないと登録できない' do
      @product.delivery_from_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery from must be other than 1")
    end
    it 'delivery_date_idが選択されていないと登録できない' do
      @product.delivery_date_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery date must be other than 1")
    end
    it 'priceが空だと登録できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank","Price is invalid")
    end
    it 'priceは全角数字だと登録できない' do
      @product.price = '００００'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is invalid")
     end
    end
  end
end
