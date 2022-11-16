class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image_url, :dependent => :destroy
  validates :name, :description, :priceUnit, :stockAmount, :image_url, presence: true
end
