class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/items'
    else
      render 'new'
    end
  #render plain: params[:item].inspect
  end
  def edit
    @item = findItem()
  end

  def update
    @item = findItem()

    if @item.update(item_params)
      redirect_to '/items'
    else
      render 'edit'
    end
  end

  def destroy
    @item = findItem()
    @item.destroy
    redirect_to '/items'
  end

  def show
    @item = findItem()
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
