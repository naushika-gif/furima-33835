FactoryBot.define do
  factory :buyer_address do
    postal_code     {"000-0000"}
    delivery_from_id {2}
    city            {Faker::Lorem.sentence}
    house_number    {Faker::Lorem.sentence}
    building_name   {Faker::Lorem.sentence}
    telephone_no    {"00000000000"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end