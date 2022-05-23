class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :send_days
  has_one_attached :image

  validates :image,          presence: true
  validates :name,           presence: true
  validates :description,    presence: true
  validates :category_id,    presence: true
  validates :item_status_id, presence: true
  validates :cost_id,        presence: true
  validates :prefecture_id,  presence: true
  validates :send_days_id,   presence: true
  validates :price,          presence: true
  validates :user,           presence: true
end
