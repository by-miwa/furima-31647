require 'rails_helper'
RSpec.describe RecordStreet, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
      @record_street = FactoryBot.build(:record_street)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての項目の入力が存在すれば購入できる' do
        expect(@record_street).to be_valid
      end

      it 'apartmentの入力が存在しても購入できる' do
        @record_street.apartment = 'ビル１０１'
        @record_street.valid?
      end

      it 'apartmentの入力が存在しなくても購入できる' do
        @record_street.apartment = nil
        @record_street.valid?
      end
    end

    context '商品がうまくいかないとき' do
      # nul:false, presence: true のテスト ▼

      it 'postalが空だと購入できない' do
        @record_street.postal = nil
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Postal can't be blank", "Postal is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが空では購入できない' do
        @record_street.prefecture_id = nil
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @record_street.city = nil
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では購入できない' do
        @record_street.address = nil
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @record_street.phone_number = nil
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では購入できない' do
        @record_street.token = nil
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @record_street.postal = '4211131'
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end

      it '電話番号にはハイフンは不要でないと購入できない' do
        @record_street.phone_number = '090-1234-5678'
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end

      it '電話番号には11桁以内でないと購入できない' do
        @record_street.phone_number = '090123456789'
        @record_street.valid?
        expect(@record_street.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end

    end
    end
  end
end