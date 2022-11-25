class ApplicationController < ActionController::Base
  before_action :authorized
  #before_action :admin
  helper_method :current_user_orders
  helper_method :current_user
  helper_method :current_cart
  helper_method :logged_in?
  helper_method :isAdmin?
  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_cart
    Cart.find_by_user_id(session[:user_id])
  end

  def current_user_orders
    Order.where("user_id":session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/login' unless logged_in?
  end

  def isAdmin?
    if logged_in?
      return current_user.admin
    end
    return false
  end
  # def admin
  #   redirect_to '/welcome' unless isAdmin?
  # end
end
