class Product < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_cost_id
  belongs_to :delivery_from_id
  belongs_to :delivery_date_id

  with_options presence:true do
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_cost_id
    validates :delivery_from_id
    validates :delivery_date_id

  with_options numericality: { other_than: 1} do
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
