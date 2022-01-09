class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_receiver = PurchaseReceiver.new 
  end
  def create
    @item = Item.find(params[:item_id])
    @purchase_receiver  = PurchaseReceiver.new(purchase_receiver_params)
  end

  private

  def purchase_receiver_params 
    params.require(:purchase_receiver).permit(:zip, :prefecture_id, :city, :block, :build, :phone).merge(user_id: current_user.id,item_id: params[:item_id])
  end
end
