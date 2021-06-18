class BuyerAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :delivery_from_id, :city, :house_number, :building_name, :telephone_no,  :user_id, :product_id

  with_options presence: true do
    validates :token
    validates :user_id
    validates :product_id
    validates :city
    validates :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :delivery_from_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :telephone_no, format: { with: /\A\d{10}$|^\d{11}\z/}
  end
   
  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Buyer.create(postal_code: postal_code, delivery_from_id: delivery_from_id, city: city, house_number: house_number, building_name: building_name, telephone_no: telephone_no, purchase_id: purchase.id)
  end
end
