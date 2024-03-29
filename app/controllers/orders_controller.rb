class OrdersController < ApplicationController
  def index
     @orders = Order.where("user_id":current_user.id).order("id DESC")
  end

  def new
    @order = Order.new
  end

  def create
    @cart = Cart.find_by_user_id(current_user.id)
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

  def cancel
    @order = Order.find(params[:id])
    if !@order.nil? and @order.state == 0
      @order.state = 3
      @order.save
      self.returnIfNotApproved(@order)
      flash[:notice] = "Order canceled successfully"
    else
      flash[:notice] = "Not canceled"
    end
    redirect_to '/orders'
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :address, :state)
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
