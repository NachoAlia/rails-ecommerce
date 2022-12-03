# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /users/sign_in
  # def new
  #   super
  # end

  #POST /users/sign_in
  # def create
  #   super
  #   createCart
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # private
  # def createCart
  #   @user.create_cart() if @user.cart.nil?
  # end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
