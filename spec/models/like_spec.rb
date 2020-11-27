require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#create' do
    it "user_idとlike_idが存在すれば登録できること" do
      user=create(:user)
      item=create(:item)
      like =build(:like, user_id:user.id, item_id:item.id)
      like.valid?
      expect(like).to be_valid
    end

    it "user_idとlike_idが空であれば登録できないこと" do
      user=create(:user)
      item=create(:item)
      like =build(:like, user_id:nil, item_id: nil)
      like.valid?
      expect(like.errors[:item_id]).to include("を入力してください")
      expect(like.errors[:user_id]).to include("を入力してください")
    end

    it "user_idが空では登録できないこと" do
      user=create(:user)
      item=create(:item)
      like =build(:like, user_id:nil, item_id: item.id)
      like.valid?
      expect(like.errors[:user_id]).to include("を入力してください")
    end

    it "item_idが空では登録できないこと" do
      user=create(:user)
      item=create(:item)
      like =build(:like, user_id:user.id, item_id: nil)
      like.valid?
      expect(like.errors[:item_id]).to include("を入力してください")
    end
    
  end
end