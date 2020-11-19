require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品の新規投稿' do
      context '新規投稿がうまくいくとき' do
        it '全ての項目の入力が存在すれば登録できること' do
          expect(@item).to be_valid
        end
      end

      context '新規投稿がうまくいかないとき' do
        # nul:false, presence: true のテスト ▼

        it '商品画像を1枚つけないと投稿できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it '商品名がないと投稿できない' do
          @item.title = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it '商品の説明がないと投稿できない' do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it 'カテゴリーの情報がないと投稿できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it '商品の状態についての情報がないと投稿できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Status is not a number')
        end

        it '配送料の負担についての情報がないと投稿できない' do
          @item.delivery_fee = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee is not a number')
        end

        it '発送元の地域についての情報がないと投稿できない' do
          @item.area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Area is not a number')
        end

        it '発送までの日数についての情報がないと投稿できない' do
          @item.days_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Days is not a number')
        end

        # id = 1では保存できない制限のテスト ▼

        it 'カテゴリーの情報がidが1だと投稿できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it '商品の状態についての情報がidが1だと投稿できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end

        it '配送料の負担についての情報がidが1だと投稿できない' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
        end

        it '発送元の地域についての情報がidが1だと投稿できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end

        it '発送までの日数についての情報がidが1だと投稿できない' do
          @item.days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Days must be other than 1')
        end

        # 価格のテスト ▼

        it '価格についての情報がないと投稿できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格の範囲が、¥300~¥9,999,999の間でないと投稿できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it '価格の範囲が、¥300~¥9,999,999の間でないと投稿できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end

        it '販売価格は半角数字でないと投稿できない' do
          @item.price = '１２３４５'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
