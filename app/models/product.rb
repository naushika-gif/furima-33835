class Product < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_cost_id
  belongs_to :delivery_from_id
  belongs_to :delivery_date_id
end
