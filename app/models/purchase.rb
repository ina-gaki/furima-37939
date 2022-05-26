class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  had_one    :shipping_address
end