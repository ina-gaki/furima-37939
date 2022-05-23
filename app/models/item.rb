class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :send_days
  has_one_attached :image
  belongs_to :user

  validates :image,          presence: true
  validates :name,           presence: true , length: { maximum: 40 }
  validates :description,    presence: true , length: { maximum: 1000 }
  validates :category_id,    presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_status_id, presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :cost_id,        presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :prefecture_id,  presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :send_days_id,   presence: true , numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price,          presence: true , inclusion:  { in: 300..9999999 }
  validates :user,           presence: true
end
