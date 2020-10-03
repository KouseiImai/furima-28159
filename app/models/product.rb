class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day

  has_one_attached :image


  #バリデーション
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_day_id
  end

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: { only_integer: true }, inclusion:{ in: 300..9999999 }, format: { with: /\A[0-9]+\z/}
  end
end
