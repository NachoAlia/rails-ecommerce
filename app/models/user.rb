class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
