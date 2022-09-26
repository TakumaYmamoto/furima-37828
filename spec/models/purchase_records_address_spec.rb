require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_address = FactoryBot.build(:purchase_record_address, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必須項目の入力があれば購入できる' do
        expect(@purchase_record_address).to be_valid
      end
      it 'name_of_the_buildingの入力が空でも購入できる' do
        @purchase_record_address.name_of_the_building = ''
        expect(@purchase_record_address).to be_valid
        
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空では購入できない' do
        @purchase_record_address.postal_code = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角数値とhyphen(-)で入力されなければ商品は購入できない' do
        @purchase_record_address.postal_code = '000000'
        @purchase_record_address.valid?
        expect(@purchase_record_addresss.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では登録できない' do
        @purchase_record_address.prefecture_id = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1{---}では購入できない' do
        @purchase_record_address.prefecture_id = 1
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_record_address.city = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では購入できない' do
        @purchase_record_address.street_address = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @purchase_record_address.telephone_number = ''
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @purchase_record_address.telephone_number = '000000000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @purchase_record_address.telephone_number = '000000000000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数値で入力されなければ商品は購入できない' do
        @purchase_record_address.telephone_number = '０００００００００００'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが半角数値のみで入力されなければ商品は購入できない' do
        @purchase_record_address.telephone_number = '000-0000-0000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では購入できない" do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では購入できない" do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @purchase_record_address.item_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
