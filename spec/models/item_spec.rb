require 'rails_helper'

describe Item do
  before do
    @user = FactoryBot.create(:user)
  end

  it "factory_botが有効かどうか" do
    user = @user
    expect(user).to be_valid
  end

  describe '#create' do
    it "titleとpriceとdetailsとuser_idが存在すれば登録できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "titleが空では登録できないこと" do
      item = build(:item, title: nil)
      item.valid?
      expect(item.errors[:title]).to include("は1文字以上で入力してください")
    end

    it "priceが空では登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("は1文字以上で入力してください")
    end

    it "detailsが空では登録できないこと" do
      item = build(:item, details: nil)
      item.valid?
      expect(item.errors[:details]).to include("は1文字以上で入力してください")
    end

    it "titleが51文字以上であれば登録できないこと" do
      item = build(:item, title: "123456789012345678901234567890123456789012345678901")
      item.valid?
      expect(item.errors[:title]).to include("は50文字以内で入力してください")
    end

    it "titleが50文字以下であれば登録できること" do
      item = build(:item, title: "12345678901234567890123456789012345678901234567890")
      item.valid?
      expect(item).to be_valid
    end

    it "priceが12文字以上であれば登録できないこと" do
      item = build(:item, price: "123456789012")
      item.valid?
      expect(item.errors[:price]).to include("は11文字以内で入力してください")
    end

    it "priceが11文字以下であれば登録できること" do
      item = build(:item, price: "12345678901")
      item.valid?
      expect(item).to be_valid
    end

    it "detailsが151文字以上であれば登録できないこと" do
      item = build(:item, details: "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901")
      item.valid?
      expect(item.errors[:details]).to include("は150文字以内で入力してください")
    end

    it "detailsが150文字以下であれば登録できること" do
      item = build(:item, details: "12345678901")
      item.valid?
      expect(item).to be_valid
    end

  end
end