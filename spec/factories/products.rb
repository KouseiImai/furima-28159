FactoryBot.define do
  factory :product do
    user_id               { Faker::Number.number(digits: 1) }
    name                  { Faker::Commerce.product_name }
    explanation           { Faker::Commerce.product_name }
    category_id           { Faker::Number.within(range: 2..10) }
    condition_id          { Faker::Number.within(range: 2..7) }
    shipping_charge_id    { Faker::Number.within(range: 2..48) }
    shipping_area_id      { Faker::Number.within(range: 2..3) }
    shipping_day_id       { Faker::Number.within(range: 2..4) }
    price                 { Faker::Number.within(range: 300..9_999_999) }
  end
end
