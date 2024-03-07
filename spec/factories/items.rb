FactoryBot.define do
  factory :item do
    item_name { "テスト商品" }
    category_id { 2 }
    area_id { 2 }  
    condition_id { 2 }
    price { 1000 }
    load_id  { 2 }
    deadline_id { 2 }
    explanation { "これはテスト商品の説明です。" }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
