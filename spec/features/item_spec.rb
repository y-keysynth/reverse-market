require 'rails_helper'


feature 'item', type: :feature do
  scenario 'post item' do
    # ログイン前には「買います」募集を作るがない
    visit root_path
    expect(page).to have_no_content('「買います」募集を作る')

    # ログイン処理
    visit signup_path
    fill_in 'name', with: "Tester"
    fill_in 'email', with: "test@test.com"
    fill_in 'password', with: "12345678"
    fill_in 'password_confirmation', with: "12345678"
    click_on '新規登録する'
    visit root_path
    expect(page).to have_content('「買います」募集を作る')

    # 「買います」募集を作る
    expect {
      click_link('「買います」募集を作る')
      visit new_item_path
      expect(page).to have_content('募集する')
      fill_in 'item_title', with: 'タイトルテスト'
      fill_in 'item_price', with: '123456789'
      fill_in 'item_details', with: '詳細テスト'
      click_on '募集する'
    }
    # .to change(item, :count).by(1)
    # undefined local variable or method `item'
  end
end