require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規出品' do
    context '商品出品できる場合' do
      it '全て正しく入力していたら登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'nameが空だと登録できない' do
        @item.name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryで「ーー」を選択した時は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_statusで「ーー」を選択した時は登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'costで「ーー」を選択した時は登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'prefectureで「ーー」を選択した時は登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'send_daysで「ーー」を選択した時は登録できない' do
        @item.send_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send days can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'nameが40文字以内の時のみ登録できる' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'descriptionが1000文字以内の時のみ登録できる' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end
      it 'priceは300円未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceは9999999より大きいと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格に半角数字以外が含まれていると登録できない' do
        @item.price = '10００' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
