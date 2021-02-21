require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address,user_id:1, item_id:1)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'token,postal_code,prefecture_id,municipality,address,phone_numberがあれば商品購入できる' do
        expect(@buy_address).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'tokenが空では商品出品できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では商品出品できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンがないと商品出品できない' do
        @buy_address.postal_code = '123exit4567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code の登録にはハイフンが必要です")
      end
      it 'prefecture_idが空では商品出品できない' do
        @buy_address.prefecture_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture is not a number")
      end
      it 'municipalityが空では商品出品できない' do
        @buy_address.municipality = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では商品出品できない' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では商品出品できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁以内でないと商品出品できない' do
        @buy_address.phone_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number の登録には11桁以内の半角数字のみです")
      end
      it 'phone_numberは半角数字のみでないと商品出品できない' do
        @buy_address.phone_number = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number の登録には11桁以内の半角数字のみです")
      end
    end
  end
end
