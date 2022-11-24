class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    session[:user_id] = nil
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:firstname,:lastname, :email, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
  def goToRoot
    redirect_to '/welcome'
  end
end
