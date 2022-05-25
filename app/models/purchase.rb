class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :shipping_address
end
