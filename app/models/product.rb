class Product < ApplicationRecord
  
  #バリデーション
  with_options presence: true do
    validates :neme
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_erea_id
    validates :shipping_day_id
    validates :price
  end
end
