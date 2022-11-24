class Cart < ApplicationRecord
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :user

  def totalPrice
    @items = self.cart_items.reject{|i| i.total.nil?}
    @items.inject(0){|sum, item| sum + item.total}
  end
end
