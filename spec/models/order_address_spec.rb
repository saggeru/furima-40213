require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it '項目すべてにデータが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名の値がなくても購入できる' do
        @building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号の値が空のとき購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号は3桁ハイフン4桁の形式でないと購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県の値が空のとき購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村の値が空のとき購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地の値が空のとき購入できない' do
        @order_address.address_no = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address no can't be blank")
      end

      it '電話番号の値が空のとき購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end