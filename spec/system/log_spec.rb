require 'rails_helper'

RSpec.describe 'Logs', type: :system do
  before do
    @user = create(:user)

    visit new_user_session_path

    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'ログイン'
  end

  describe 'ログ登録関係画面' do
    before do
      visit new_log_path
    end

    context 'ログを作成した場合' do
      example '内容確認画面に遷移する' do
        fill_in 'log[started_on]', with: Date.today
        fill_in 'log[ended_on]', with: Date.today
        # タグ付けがfill_inで出来ないので未実装

        # やったことフォーム
        fill_in 'log[dones_attributes][0][title]', with: 'やったこと'
        fill_in 'log[dones_attributes][0][worktime]', with: 90
        fill_in 'log[dones_attributes][0][comment]', with: 'やったことの詳細'
        
        # わかったことフォーム
        fill_in 'log[knowledges_attributes][0][title]', with: 'わかったこと'
        fill_in 'log[knowledges_attributes][0][comment]', with: 'わかったことの詳細'

        # 次やることフォーム
        fill_in 'log[todos_attributes][0][title]', with: '次やること'
        fill_in 'log[todos_attributes][0][when_to_do]', with: Date.today + 3.days

        click_on '送信する'
        expect(page).to have_text '確認画面'
      end
    end

  end
end