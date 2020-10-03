require 'rails_helper'

def basic_authentication_pass(path)
  username = 'MY_USERNAME'
  password = 'MY_PASSWORD'
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

RSpec.describe '商品出品画面への遷移', type: :system do
  context '商品出品画面へ遷移出来る場合' do
    it 'ログインしているユーザーだけが商品出品画面へ遷移する' do
      # basic認証通過後トップ画面へ遷移する
      basic_authentication_pass root_path
      visit root_path
      visit new_product_path
      expect(current_path).to eq new_product_path
    end
  end
end

