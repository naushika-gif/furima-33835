FactoryBot.define do
  factory :user do
    nickname      {'test'}
    email          {'test@example'}
    password       {'12345a'}
    encrypted_password {'12345a'}
    family_name_jap    {'山田'}
    family_name_kana   {'ヤマダ'}
    first_name_jap     {'太郎'}
    first_name_kana    {'タロウ'}
    birthday           {'2000-05-31'}
  end
end