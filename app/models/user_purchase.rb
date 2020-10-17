class UserPurchase

  include ActiveModel::Model
  attr_accessor :product_id, :user_id, :postal_code, :prefecture_id, :municipal, :address, :building_name, :phone_number
  
  def save
    purchase = Purchase.create!(user_id: user_id, product_id: product_id)
    Buyer.create!(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, municipal: municipal, address: address, building_name: building_name, phone_number: phone_number)
  end
end