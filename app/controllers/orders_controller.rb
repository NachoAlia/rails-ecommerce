class OrdersController < ApplicationController
  def index
     @orders = Order.where("user_id":session[:user_id])
  end
  def new
    @order = Order.new
  end
  def create
    @cart = Cart.find_by_user_id(session[:user_id])
    @cart_items = CartItem.where("cart_id":@cart.id)
    @order = Order.new(order_params)
    if @order.save
      @cart_items.each do |row|
        OrderItem.create("order_id":@order.id, "item_id":row.item_id, "amount":row.amount, "total":row.total)
      end
      @cart.items.clear
      redirect_to orders_path
    else
      render 'new'
    end

  end
  private
  def order_params
    params.require(:order).permit(:user_id, :address, :state)
  end
end