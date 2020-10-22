class UserPurchase

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :product_id, :user_id, :postal_code, :prefecture_id, :municipal, :address, :building_name, :phone_number, :token, :price
  
  with_options presence: true do
    validates :token
    validates :price
    validates :product_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input 7 characters and Including hyphen(-)."}
    validates :prefecture_id, numericality: { other_than: 0, only_integer: true ,message: " can't be blank."}
    validates :municipal, format: { with: /\A[ぁ-んァ-ンー-龥]/, message: "is invalid. Input full-width characters."}
    validates :address, format: { with: /([ぁ-んァ-ンー-龥])(\d)/, message: "is invalid. Input full-width characters and numbers."}
    validates :phone_number, format: { with: /\A\d{10,11}\z/}, format: { with: /\A[090]/, message: "is not included 090"}, length: { maximum: 11}, numericality: true
  end

  def save
    purchase = Purchase.create!(user_id: user_id, product_id: product_id)
    Buyer.create!(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, municipal: municipal, address: address, building_name: building_name, phone_number: phone_number)
  end
end