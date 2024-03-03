FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Date.new(2000, 1, 1) }
    first_name_kanji { '田中' }
    last_name_kanji { '太郎' }
    first_name_katakana { 'タナカ' }
    last_name_katakana { 'タロウ' }
  end
end