FactoryBot.define do
  factory :buyer_address do
    postal_code {"000-0000"}
    delivery_from_id {2}
    city {Faker::Lorem.sentence}
    house_number {Faker::Lorem.sentence}
    telephone_no {"000-0000-0000"}
    association :purchase
  end
end