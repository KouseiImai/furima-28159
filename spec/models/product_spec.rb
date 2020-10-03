require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload("/images/test_image.jpg")
  end

  describe '商品出品' do
    context '商品出品が行える場合' do
      it '商品出品に必要な情報が入力されていると登録できる' do
        expect(@product).to be_valid
      end

    end

    context '商品出品が行えない場合' do
      it "画像が空だと登録出来ない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録出来ない" do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空だと登録出来ない" do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーの情報が空だと登録出来ない" do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it "商品の状態についての情報が空だと登録出来ない" do
        @product.condition_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition is not a number")
      end
      it "発送料の負担についての情報が空だと登録出来ない" do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge is not a number")
      end
      it "発送元の地域についての情報が空だと登録出来ない" do
        @product.shipping_area_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area is not a number")
      end
      it "発送までの日数についての情報が空だと登録出来ない" do
        @product.shipping_day_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day is not a number")
      end
      it "価格についての情報が空だと登録出来ない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300より低いと登録出来ない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格の範囲が、¥9999999より低いと登録出来ない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格は半角数字のみ保存可能である事" do
        @product.price = "３００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
