class BackstoreController < ApplicationController
  before_action :onlyAdmin!
  def index
    @items = Item.all
    @orders = Order.all.order("id DESC")
  end
  def orders
    @items = Item.all
    @orders = Order.all.order("id DESC")
  end
  def order_approve
    @order = Order.find(params[:id])
    result = self.order_change_state(@order,1)
    flash[:notice] = "Order approved successfully" if result
    flash[:notice] = "An error ocurred." if !result
    redirect_to '/backstore'
  end
  def order_reject
    @order = Order.find(params[:id])
    result = self.order_change_state(@order, 2)
    flash[:notice] = "Order rejected successfully" if result
    flash[:notice] = "An error ocurred." if !result
    redirect_to '/backstore'
  end
  private
  def order_change_state(order, state)
    if !order.nil? and order.state == 0
      order.state = state
      order.save
      self.returnIfNotApproved(order) if state == 2
      return true
    end
      return false
  end
  def returnIfNotApproved(order)
    @order_items = OrderItem.where("order_id":order.id)
    if !@order_items.nil?
      @order_items.each do |row|
        item = Item.find(row.item_id)
        item.stockAmount = item.stockAmount.to_i + row.amount.to_i
        item.available = 1
        item.save
      end
    end
  end
end
