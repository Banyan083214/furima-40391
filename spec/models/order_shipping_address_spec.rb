require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: @user.id, item_id: @item.id)
  end  

  describe '注文' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping_address).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_shipping_address.building = nil
        expect(@order_shipping_address).to be_valid
      end
    end

    context "出荷先情報が不正な場合" do
      it "郵便番号が入力されていない場合は無効であること" do
        @order_shipping_address.postal_code = nil
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "郵便番号が無効な場合は無効であること" do
        @order_shipping_address.postal_code = '1234567'
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "都道府県が入力されていない場合は無効であること" do
        @order_shipping_address.area_id = nil
        expect(@order_shipping_address).not_to be_valid
      end

      it "市区町村が入力されていない場合は無効であること" do
        @order_shipping_address.city = nil
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "番地が入力されていない場合は無効であること" do
        @order_shipping_address.street_address = nil
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "電話番号が入力されていない場合は無効であること" do
        @order_shipping_address.telephone_number = nil
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "電話番号が短すぎる場合は無効であること" do
        @order_shipping_address.telephone_number = '123'
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "電話番号に数字以外が含まれている場合は無効であること" do
        @order_shipping_address.telephone_number = '123456789a'
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "ユーザーが関連付けられていない場合は無効であること" do
        @order_shipping_address.user_id = nil
        expect(@order_shipping_address).not_to be_valid
      end
  
      it "商品が関連付けられていない場合は無効であること" do
        @order_shipping_address.item_id = nil
        expect(@order_shipping_address).not_to be_valid
      end
    end
  end
end
