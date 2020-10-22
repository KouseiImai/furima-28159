FactoryBot.define do
  factory :user_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    price { 500 }
    product_id { 5 }
    user_id { 10 }
    postal_code { '123-4567' }
    prefecture_id { 27 }
    municipal { '白山町' }
    address { '白山1-2-3' }
    phone_number { '09012345678' }
  end
end
