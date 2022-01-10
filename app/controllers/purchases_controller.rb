class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_bought, only: [:index, :create]

  def index
    @purchase_receiver = PurchaseReceiver.new 
  end
  
  def create
    @purchase_receiver  = PurchaseReceiver.new(purchase_receiver_params)
    if @purchase_receiver.valid?
      pay_item
     @purchase_receiver.save
     redirect_to root_path
   else
     render 'index'
   end
  end

  private

  def purchase_receiver_params 
    params.require(:purchase_receiver).permit(:zip, :prefecture_id, :city, :block, :build, :phone).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_bought
    if @item.user_id == current_user.id || @item.purchase != nil
      redirect_to root_path
    end
  end
end
