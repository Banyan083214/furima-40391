require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品投稿' do
    context '出品投稿できる場合' do
      it 'すべてが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '出品投稿できない場合' do
      it 'item_nameがないと無効であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'category_idがないと無効であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'area_idがないと無効であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'condition_idがないと無効であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'priceがないと無効であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数字でないと無効であること' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが300以上でないと無効であること' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが9999999以下でないと無効であること' do
        @item.price = '100000000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'load_idがないと無効であること' do
        @item.load_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end

      it 'deadline_idがないと無効であること' do
        @item.deadline_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Deadline can't be blank")
      end

      it 'explanationがないと無効であること' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'imageがないと無効であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idが1だと無効であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'area_idが1だと無効であること' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it 'condition_idが1だと無効であること' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'load_idが1だと無効であること' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Load can't be blank")
      end

      it 'deadline_idが1だと無効であること' do
        @item.deadline_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deadline can't be blank")
      end

      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')      
      end
    end
  end  
end
