class ShippingAddress < ApplicationRecord
  belongs_to :purchase


  validates :postal_code,             presence: true , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,           presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :city,                    presence: true 
  validates :shipping_address,        presence: true 
  validates :phone_number,            presence: true 
  validates :purchase,                presence: true 
end
