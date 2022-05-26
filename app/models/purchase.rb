class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :shipping_address


  validates :item,     presence: true 
  validates :user,     presence: true 
end