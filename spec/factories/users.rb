FactoryBot.define do
  factory :user do
    nickname      {Faker::Name.initials(number: 2)}
    email          {Faker::Internet.free_email}
    password       { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    family_name_jap    {'山田'}
    family_name_kana   {'ヤマダ'}
    first_name_jap     {'太郎'}
    first_name_kana    {'タロウ'}
    birthday           {'2000-05-31'}
  end
end