require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、名前とカナ、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠が入っていなければ登録できない' do
        @user.email = "yyyytest.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        current_user = FactoryBot.build(:user)
        current_user.email = @user.email
        current_user.valid?
        expect(current_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "4y4y4y4y"
        @user.password_confirmation = "3t3t3t3t"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "5t5t5"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordに数字のみでは登録できない' do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end 
      it 'passwordは全角では登録できないこと' do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'last_nameが空では登録できない'do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない'do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが半角では登録できない'do
        @user.last_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Input full-width characters")
      end
      it 'first_nameが空では登録できない'do
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Input full-width characters")
      end
      it 'last_kanaが空では登録できない'do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'first_kanaが空では登録できない'do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'last_kanaが半角では登録できない'do
        @user.last_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana Input full-width katakana characters")
      end
      it 'first_kanaが空では登録できない'do
        @user.first_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana Input full-width katakana characters")
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end