require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品する商品の保存' do
    context "出品する商品のデータが保存できるとき" do
      it '全ての項目の入力が存在されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '出品する商品のデータが保存できないとき'
    it 'imageが添付されていないと登録できない' do
      @product.image = ''
      @product.valid?
      binding.pry
    end
    it 'nameが空では登録できない' do
    end
    it 'explanationが空では登録できない' do
    end
    it 'category_idが選択されていないと登録できない' do
    end
    it 'condition_idが選択されていないと登録できない' do
    end
    it 'delivery_cost_idが選択されていないと登録できない' do
    end
    it 'delivery_from_idが選択されていないと登録できない' do
    end
    it 'delivery_date_idが選択されていないと登録できない' do
    end
    it 'priceが空だと登録できない' do
    end
    it '' do
    end
    it '' do
    end
    it '' do
    end
  end
end
