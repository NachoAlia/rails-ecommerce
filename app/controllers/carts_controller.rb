class CartsController < ApplicationController
  def index
    @cart = Cart.find_by_user_id(session[:user_id])
    @cart_items = CartItem.where("cart_id":@cart.id)
  end
  def addItem
    @cart = Cart.find_by_user_id(session[:user_id])
    @item = Item.find(params[:item_id])
    @cart_item = CartItem.create("cart_id": @cart.id,"item_id": @item.id, "amount":params[:cant], "total":(@item.priceUnit.to_f * params[:cant].to_i) )
    @item.update(stockAmount: (@item.stockAmount.to_i - params[:cant].to_i))
    @item.update(available:0) if (@item.stockAmount==0)
    redirect_to '/welcome'
  end
  def deleteItem
    @cart = Cart.find_by_user_id(session[:user_id])
    @item = Item.find(params[:item_id])
    @cart.items.delete(@item)
    @item.update(available:1) if (@item.stockAmount==0)
    @item.update(stockAmount: (@item.stockAmount.to_i + params[:cant].to_i))
    redirect_to '/cart'
  end
  def emptyCart
    @cart = Cart.find_by_user_id(session[:user_id])
    @cart_items = CartItem.where("cart_id":@cart.id)
    @cart_items.each do |row,item|
      item = Item.find(row.item_id)
      @cart.items.delete(item)
      item.update(available:1) if (item.stockAmount==0)
      item.update(stockAmount: (item.stockAmount.to_i + row.amount.to_i))
    end
    redirect_to '/cart'
  end
end
