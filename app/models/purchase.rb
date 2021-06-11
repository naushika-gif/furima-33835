class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :Product
  has_one :buyer
end
