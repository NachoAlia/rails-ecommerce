class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :destroy]
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      if(params[:email].empty? || params[:password].empty?)
        flash[:notice] = "Los campos no pueden estar vacios"
      else
        flash[:notice] = "Email o contraseña incorrectos"
      end
      redirect_to '/login'
    end
  end

  def login
    session[:user_id] = nil
    @user = nil
    redirect_to '/welcome'
  end
  def destroy
    session[:user_id] = nil
    @user = nil
    redirect_to '/login'
  end
  def welcome
  end
end
