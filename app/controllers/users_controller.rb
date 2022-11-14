class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:firstname,:lastname, :email, :password))
    if @user
      render 'new'
    else
      session[:user_id] = @user.id
      redirect_to '/welcome'
    end

  end
end
