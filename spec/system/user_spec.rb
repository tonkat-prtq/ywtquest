require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ユーザー登録画面' do
    context 'ユーザーのデータがなくログインしていない場合' do
      example 'ユーザー新規登録が出来る' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'firstUser'
        fill_in 'user[email]', with: 'firstuser@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録する'
        expect { click_button '登録する' }.to change { ActionMailer::Base.deliveries.size }.by(1)
        # click_on 'メールアドレスの確認'
        # expect(page).to have_content 'メールアドレスが確認できました。'
      end
    end
  end
end