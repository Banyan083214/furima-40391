FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    area_id { 1 }
    city { '明石市' }
    street_address { '1-1' }
    building { '東京ハイツ' }
    telephone_number { '09012345678' }


  end
end
