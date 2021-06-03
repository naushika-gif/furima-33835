FactoryBot.define do
  factory :product do
    name        {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    category_id {2}
    condition_id {2}
    delivery_cost_id {2}
    delivery_from_id {2}
    delivery_date_id {2}
    price {'5000'}
    association :user
  end
end
