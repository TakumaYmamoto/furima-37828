class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_time_number
  has_one :order

  validates :item_name,                presence: true
  validates :item_description,         presence: true
  validates :category_id,              presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_status_id,           presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,          presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,            presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_time_number_id,  presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,                    presence: true, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
end
