class Product < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  # モデル名
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :delivery_from
  belongs_to :delivery_date

  with_options presence:true do
    validates :name
    validates :explanation

  with_options numericality: { other_than: 1} do
    # カラム名
      validates :category_id
      validates :condition_id
      validates :delivery_cost_id
      validates :delivery_from_id
      validates :delivery_date_id
  end

   with_options numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"} do
      validates :price  
   end
  end
end
