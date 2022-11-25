class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user
  validates :address, presence: true

  def totalPrice
    @items = self.order_items.reject{|i| i.total.nil?}
    @items.inject(0){|sum, item| sum + item.total}
  end
  def stateString
    case self.state
      when 0
        return "Waiting"
      when 1
        return "Approved"
      else
        return "Rejected"
      end
    end
end
