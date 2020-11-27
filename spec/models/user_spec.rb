require 'rails_helper'

describe User do
  describe '#create' do
    it "urlとemailとランダムパスワード、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "urlが空では登録できないこと" do
      user = build(:user, url: nil)
      user.valid?
      expect(user.errors[:url]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上に設定して下さい。")
    end

    it "重複したurlが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, name: user.url)
      another_user.valid?
      expect(another_user.errors[:url]).to include("はすでに存在します")
    end

  end
end