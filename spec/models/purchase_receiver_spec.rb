require 'rails_helper'

RSpec.describe PurchaseReceiver, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_receiver = FactoryBot.build(:purchase_receiver,user_id: user.id,item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it "全ての情報が入っていれば登録できる" do
      expect(@purchase_receiver).to be_valid
    end
    it 'buildは空でも保存できる' do
      @purchase_receiver.build = ''
      expect(@purchase_receiver).to be_valid
    end
    it 'phoneは10桁で保存できる' do
      @purchase_receiver.build = '0351234567'
      expect(@purchase_receiver).to be_valid
    end
    it 'phoneは11桁で保存できる' do
      @purchase_receiver.phone = '09012345678'
      expect(@purchase_receiver).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では商品購入できない' do
      @purchase_receiver.token = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空では商品購入できない' do
      @purchase_receiver.zip = ''
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Zip can't be blank")
    end
    it 'zipに”-(ハイフン)”がなければ商品購入できない' do
      @purchase_receiver.zip = '1234567'
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include('Zip is invalid. Include hyphen(-)')
    end
    it 'zipが全角では商品購入できない' do
      @purchase_receiver.zip = "１２３-４５６７"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
    end
    it 'zipが９桁であれば商品購入できない' do
      @purchase_receiver.zip = "123-45678"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
    end
    it 'prefecture_idが選択されていない(選択肢{1})では保存できないこと' do
      @purchase_receiver.prefecture_id = "1"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では商品購入できない' do
      @purchase_receiver.city = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("City can't be blank")
    end
    it 'blockが空では商品購入できない' do
      @purchase_receiver.block = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Block can't be blank")
    end
    it 'phoneが空では商品購入できない' do
      @purchase_receiver.phone = ""
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneが全角では商品購入できない' do
      @purchase_receiver.phone = "０９０１２３４５６７８"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone is invalid. Input only number")
    end
    it 'phoneがアルファベットでは商品購入できない' do
      @purchase_receiver.phone = "abc-defg-hijk"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone is invalid. Input only number")
    end
    it 'phoneに””-(ハイフン)が入っていると商品購入できない' do
      @purchase_receiver.phone = "090-123-456"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone is invalid. Input only number")
    end
    it 'phoneが9桁では商品購入できない' do
      @purchase_receiver.phone = "090123456"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone is invalid. Input only number")
    end
    it 'phoneが12桁では商品購入できない' do
      @purchase_receiver.phone = "090123456789"
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Phone is invalid. Input only number")
    end
    it 'userが紐付いていないと商品購入できない' do
      @purchase_receiver.user_id = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと商品購入できない' do
      @purchase_receiver.item_id = nil
      @purchase_receiver.valid?
      expect(@purchase_receiver.errors.full_messages).to include("Item can't be blank")
    end
  end

end