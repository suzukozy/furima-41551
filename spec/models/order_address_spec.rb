require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user) # ユーザーを先に作成
    item = FactoryBot.create(:item, user: user) # 作成したユーザーを関連付けて item を作成
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '注文情報の保存' do
    context '注文情報の保存ができる' do
      it '全ての項目が入力されていれば保存ができる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存ができる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '注文情報の保存ができない' do
      it 'tokenが無ければ登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が無ければ登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号に「-」が無ければ登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include a hyphen (-)')
      end
      
      it '郵便番号の「-」の前が３桁で無ければ登録できない' do
        @order_address.post_code = '12-4567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include a hyphen (-)')
      end
      
      it '郵便番号の「-」の後が４桁で無ければ登録できない' do
        @order_address.post_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include a hyphen (-)')
      end
      
      it '郵便番号が整数で無ければ登録できない' do
        @order_address.post_code = 'aaa-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include a hyphen (-)')
      end
      
      it '都道府県が選択されてなければ登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空なら登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空なら登録できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空なら登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が整数でなければ登録できない' do
        @order_address.phone_number = 'aaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が10桁未満なら登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上なら登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空なら登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空なら登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
