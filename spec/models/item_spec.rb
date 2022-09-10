require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品の登録'do
   context '内容に問題ない場合' do
    it '必要情報を入力すると登録できる' do
    expect(@item).to be_valid
    end
   end

  context '商品の登録ができない時' do
    it 'item_nameが空では登録できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it 'item_descriptionが空では登録できない' do
      @item.item_description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item description can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'item_status_idが空では登録できない' do
      @item.item_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank")
    end
    it 'shipping_fee_idが空では登録できない' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it 'prefecture_idが空では登録できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'shipping_time_number_idが空では登録できない' do
      @item.shipping_time_number_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping time number can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格は300円未満であると登録できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '価格は9999999円より高いと登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    
    end
    it '価格は半角数値である必要がある' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it 'user_idが紐ついている必要ある' do
      @item.user_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end