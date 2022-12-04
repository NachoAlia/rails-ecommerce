class ApplicationController < ActionController::Base
  #before_action :authorized
  before_action :authenticate_user!
  #before_action :initialize_cart!
  #before_action :admin
  helper_method :current_user_orders
  #helper_method :current_user
  helper_method :current_cart
  helper_method :logged_in?
  helper_method :isAdmin?
  helper_method :orders
  helper_method :items
  # def current_user
  #   User.find_by(id: session_user_id)
  # end

  def current_cart
    current_user.create_cart() if current_user.cart.nil?
    Cart.find_by_user_id(current_user.id)
  end

  def current_user_orders
    Order.where("user_id":current_user.id)
  end

  def logged_in?
    !current_user.nil?
  end

  def isAdmin?
    if logged_in?
      return current_user.admin
    end
    return false
  end
  def onlyAdmin!
    redirect_to '/' unless isAdmin?
  end

  def orders
    @orders = Order.all.order("id DESC")
  end
  def items
    @items = Item.all
  end
  def session_user_id
    session["warden.user.user.key"][1][0]
  end
  def notGuest
    redirect_to '/welcome' if !current_user.nil?
  end
  # def admin
  #   redirect_to '/welcome' unless isAdmin?
  # end
end
