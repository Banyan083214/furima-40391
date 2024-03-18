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
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
  
      it "郵便番号が無効な場合は無効であること" do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid")
      end
  
      it "都道府県が入力されていない場合は無効であること" do
        @order_shipping_address.area_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end

      it 'area_idが1だと無効であること' do
        @order_shipping_address.area_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Area must be other than 1")
      end

      it "市区町村が入力されていない場合は無効であること" do
        @order_shipping_address.city = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end
  
      it "番地が入力されていない場合は無効であること" do
        @order_shipping_address.street_address = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Street address can't be blank")
      end
  
      it "電話番号が入力されていない場合は無効であること" do
        @order_shipping_address.telephone_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number can't be blank",
        "Telephone number is invalid")
      end
  
      it "電話番号が9桁以下では無効であること" do
        @order_shipping_address.telephone_number = '123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      
      it "電話番号が12桁以上では無効であること" do
        @order_shipping_address.telephone_number = '123456789123'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it "電話番号に数字以外が含まれている場合は無効であること" do
        @order_shipping_address.telephone_number = '123456789a'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end

      it "トークンが入力されていない場合は無効であること" do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザー情報がない場合は登録できないこと' do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")      
      end

      it 'アイテム情報がない場合は登録できないこと' do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")     
      end
    end
  end
end
