class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show,:edit]

  def index
    @items = Item.all.order("items.created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to item_path
    else
      item.save
      @item = item
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :quality_id, :fee_id, :prefecture_id, :before_shipping_id, :price, :image).merge(user_id: current_user.id)
  end
  def move_to_sign_in
    unless user_signed_in?
      redirect_to action: "new_user_session_path"
    end
  end
  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
