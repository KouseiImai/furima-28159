class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  has_one_attached :image


  #バリデーション
  validates :category_id, numericality: { other_than:1 }
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
