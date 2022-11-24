class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :firstname, :lastname, :email, :password, presence: true
  validates :email, confirmation: { case_sensitive: false }, uniqueness: true
  has_secure_password
end
