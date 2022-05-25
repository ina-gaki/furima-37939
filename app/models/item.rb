class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :send_days
  has_one_attached :image
  belongs_to :user
  belongs_to :purchase

  validates :image,          presence: true
  validates :name,           presence: true , length: { maximum: 40 }
  validates :description,    presence: true , length: { maximum: 1000 }
  validates :category_id,    presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_status_id, presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :cost_id,        presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,  presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :send_days_id,   presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price,          presence: true , numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
