class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only:[:guest]

  def index
    @items = Item.all
  end

  def guest
    redirect_to '/welcome' if !current_user.nil?
    @items = Item.all
  end

end
