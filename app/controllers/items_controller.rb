class ItemsController < ApplicationController
  before_action :onlyAdmin!
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/backstore'
    else
      render 'new'
    end
  end
  def edit
    @item = findItem()
  end

  def update
    @item = findItem()

    if @item.update(item_params)
      redirect_to '/backstore'
    else
      render 'edit'
    end
  end

  def destroy
    @item = findItem()
    @item.destroy
    redirect_to '/backstore'
  end

  def show
    @item = findItem()
    @orders = Order.all
  end

  def toggleAvailable
    @item = findItem()
    @item.available = false if @item.stockAmount == 0
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :description,
       :priceUnit, :stockAmount, :available, :image_url )
  end
  private
  def findItem
    return Item.find(params[:id]) if Item.exists?(params[:id])
    return nil
  end

end
