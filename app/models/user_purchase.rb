class UserPurchase

  include ActiveModel::Model
  attr_accessor :product_id, :user_id, :postal_code, :prefecture_id, :municipal, :address, :building_name, :phone_number, :token, :price
  
  with_options presence: true do
    validates :token
    validates :price
    validates :product_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input 7 characters and Including hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, only_integer: true ,message: "can't be blank"}
    validates :municipal, format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    Address_REGEX = /([ぁ-んァ-ンー-龥])(\d)/.freeze
    validates :address, format: { with: Address_REGEX, message: "is invalid. Input full-width characters and numbers."}
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
  end

  def save
    purchase = Purchase.create!(user_id: user_id, product_id: product_id)
    Buyer.create!(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, municipal: municipal, address: address, building_name: building_name, phone_number: phone_number)
  end
end