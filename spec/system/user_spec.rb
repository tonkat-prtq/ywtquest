require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = create(:user)
  end

  describe 'ユーザー登録画面' do
    before do
      visit new_user_registration_path
    end

    context 'ユーザーのデータがなくログインしていない場合' do
      example 'ユーザー新規登録が出来る' do
        fill_in 'user[name]', with: 'firstUser'
        fill_in 'user[email]', with: 'firstuser@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '登録する'
        # 登録するボタンを押した時にuserの作成はされる
        # なのでUser.lastでその情報を持ってきて
        user = User.last
        # 変数にuser.confirmation_tokenを代入
        token = user.confirmation_token
        # 本来はメール本文に貼ってある確認用のリンクにvisitし
        # confirmation_tokenに変数tokenをセットすることによって
        # メール認証をしたことにできる
        visit user_confirmation_path(confirmation_token: token)
        expect(page).to have_content 'メールアドレスが確認できました。'
      end
    end

    context 'ユーザーのデータがありログインしていない場合' do
      example 'ユーザー新規登録が出来ない' do
        fill_in 'user[name]', with: @user.name
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        fill_in 'user[password_confirmation]', with: @user.password
        click_button '登録する'
        expect(page).to have_text 'メールアドレスはすでに存在します'
      end
    end

    context 'すでにログインしている場合' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'ログイン'
      end
      example 'ユーザー新規登録ページに飛べない' do
        visit new_user_registration_path
        expect(page).to have_text 'すでにログインしています。'
      end
    end
  end

  describe 'ログイン機能' do
    context 'ユーザーのデータがある' do
      example 'ログインができる' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'ログイン'
        expect(page).to have_text 'ログインしました。'
      end
    end
  end


end
