require 'rails_helper'


RSpec.describe TotalPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:total_purchase, user_id: user.id , item_id: item.id)
  end

    describe '購入情報' do
      context '購入情報を登録できる場合' do
        it '全て正しく入力していたら登録できる' do
        expect(@purchase).to be_valid
        end
      end
      context '購入情報を登録できない場合' do
        it 'item_idが空だと登録できない' do
          @purchase.item_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Item can't be blank")
        end
        it 'user_idが空では登録できない' do
          @purchase.user_id = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("User can't be blank")
        end
      end
    describe '発送先情報' do
      context '発送先を登録できる場合' do
        it 'buildingが空でも保存できる' do
          @purchase.building = ''
          expect(@purchase).to be_valid
        end
      end
      context '発送先を登録できない場合' do
        it 'postal_codeが空だと登録できない' do
          @purchase.postal_code = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが3桁ハイフン4桁以外だと登録できない' do
          @purchase.postal_code = '2222-2222'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'postal_codeハイフン無しだと登録できない' do
          @purchase.postal_code = '2222222'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it '発送元の地域に「---」が選択されている場合は出品できない' do
          @purchase.prefecture_id = '1'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'cityが空だと登録できない' do
          @purchase.city = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("City can't be blank")
        end
        it 'shipping_addressが空では登録できない' do
          @purchase.shipping_address = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Shipping address can't be blank")
        end
        it 'phone_numberが空だと登録できない' do
          @purchase.phone_number = ''
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが12桁以上では登録できない' do
          @purchase.phone_number = '012345678912'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberが9桁以下では登録できない' do
          @purchase.phone_number = '012345678'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
        it 'phone_numberは半角数値以外では登録できない' do
          @purchase.phone_number = '0123４56789'
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Phone number is invalid")
        end
      end
    end
    describe 'クレジットカード' do
      context 'クレジットカード情報を送信できない場合' do
        it "tokenが空では登録できないこと" do
          @purchase.token = nil
          @purchase.valid?
          expect(@purchase.errors.full_messages).to include("Token can't be blank")
        end
      end
    end

  end
end
