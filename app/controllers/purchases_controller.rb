class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_receiver = PurchaseReceiver.new 
    if @purchase_receiver.save
      redirect_to root_path
    end
  end
  
  def create
    @item = Item.find(params[:item_id])
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
end
