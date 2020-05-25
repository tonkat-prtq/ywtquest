require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ユーザー登録画面' do
    context 'ユーザーのデータがなくログインしていない場合' do
      example 'ユーザー新規登録が出来る' do
        visit new_user_registration_path
        expect(page).to have_content '登録する'
      end
    end
  end
end