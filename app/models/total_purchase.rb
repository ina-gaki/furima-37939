class TotalPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :shipping_address, :building, :phone_number, :purchase, :item_id, :user_id

  validates :item_id,                    presence: true 
  validates :user_id,                    presence: true 
  validates :postal_code,             presence: true , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,           presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :city,                    presence: true 
  validates :shipping_address,        presence: true 
  validates :phone_number,            presence: true 
  validates :purchase,                presence: true 
end
