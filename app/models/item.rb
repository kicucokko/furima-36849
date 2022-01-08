class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :quality
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :before_shipping

  validates :item_name,          presence: true
  validates :item_description,   presence: true
  validates :category_id ,       numericality: { other_than: 1 } 
  validates :quality_id,         numericality: { other_than: 1 } 
  validates :fee_id,             numericality: { other_than: 1 } 
  validates :prefecture_id,      numericality: { other_than: 1 } 
  validates :before_shipping_id, numericality: { other_than: 1 } 
  validates :price,              presence: true,inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

end