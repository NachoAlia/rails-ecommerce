class BackstoreController < ApplicationController
  before_action :onlyAdmin!
  def index
    @items = Item.all
    @orders = Order.all
  end
  def orders
    @items = Item.all
    @orders = Order.all
  end

end
