require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end
    context '商品購入が行える場合' do
      it '全ての値が正しく入力されていれば保存出来る事' do
        expect(@user_purchase).to be_valid
      end
    end

    context '商品購入が行えない場合' do
      it 'tokenが空だと購入出来ない' do
        @user_purchase.token = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'priceが空だと購入出来ない' do
        @user_purchase.price = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Price can't be blank")
      end
      it 'product_idが空だと購入出来ない' do
        @user_purchase.product_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Product can't be blank")
      end
      it 'user_idが空だと購入出来ない' do
        @user_purchase.user_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'postal_codeが空だと購入出来ない' do
        @user_purchase.postal_code = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにはハイフン(-)が無いと購入出来ない' do
        @user_purchase.postal_code = 12_345_678
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code input 7 characters and Including hyphen(-)')
      end
      it 'prefecture_idが空だと購入出来ない' do
        @user_purchase.prefecture_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalが空だと購入出来ない' do
        @user_purchase.municipal = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Municipal can't be blank")
      end
      it 'addressが空だと購入出来ない' do
        @user_purchase.address = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入出来ない' do
        @user_purchase.phone_number = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_nuberが12桁以上だと購入出来ない' do
        @user_purchase.phone_number = '123456789012'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberが-(ハイフン)を含んでいると購入できない' do
        @user_purchase.phone_number = '090123-4567'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is not a number')
      end
      it 'phone_numberに090が含まれていないと購入できない' do
        @user_purchase.phone_number = '12312345678'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is not included 090')
      end
    end
  end
end
