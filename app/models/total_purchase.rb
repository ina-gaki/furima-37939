class TotalPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :shipping_address, :building, :phone_number, :purchase, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id                 
    validates :user_id                 
    validates :postal_code , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id , numericality: { other_than: 1 , message: "can't be blank"} 
    validates :city
    validates :shipping_address
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id ,user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, shipping_address: shipping_address, building: building , phone_number: phone_number, purchase_id: purchase.id)
  end
end
