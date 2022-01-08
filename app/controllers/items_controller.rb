class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.includes(:user).order("items.created_at ASC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
     render :new
    end
  end
  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :quality_id, :fee_id, :prefecture_id, :before_shipping_id, :price, :image).merge(user_id: current_user.id)
  end

end
