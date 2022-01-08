require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    
  end

  describe '新規出品登録' do
    context '新規出品登録できるとき' do
      it 'item_name ,item_description, category_id , quality_id ,fee_id,prefecture_id,  before_shipping_id, price,imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規出品登録できないとき' do
      it 'item_nameが空では登録できない'do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空では登録できない'do
      @item.item_description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'category_idが空では登録できない'do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'category_idの値が"1"では登録できない'do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'quality_idが空では登録できない'do
      @item.quality_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Quality is not a number")
      end
      it 'quality_idの値が"1"では登録できない'do
      @item.quality_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Quality must be other than 1")
      end
      it 'fee_idが空では登録できない'do
      @item.fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee is not a number")
      end
      it 'fee_idの値が"1"では登録できない'do
      @item.fee_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it 'prefecture_idが空では登録できない'do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'prefecture_idの値が"1"では登録できない'do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'before_shipping_idが空では登録できない'do
      @item.before_shipping_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Before shipping is not a number")
      end
      it 'before_shipping_idの値が"1"では登録できない'do
      @item.before_shipping_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Before shipping must be other than 1")
      end
      it 'priceが空では登録できない'do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")      
      end
      it 'priceが300円以下では登録できない'do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")      
      end
      it 'priceが9,999,999円以上では登録できない'do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")      
      end
      it 'priceが全角では登録できない'do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")      
      end
      it 'priceがアルファベットでは登録できない'do
      @item.price = "ABC"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")      
      end
      it 'imageが空では登録できない'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")      
      end
    end
  end
end
