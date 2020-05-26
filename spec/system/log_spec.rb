require 'rails_helper'

RSpec.describe 'Logs', type: :system do
  before do
    @user = create(:user)

    @log = create(:log, user: @user)

    @done = create(:done, log: @log)
    @knowledge = create(:knowledge, log: @log)
    @todo = create(:todo, log: @log)

    visit new_user_session_path

    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'ログイン'
  end

  describe 'ログ登録画面' do
    before do
      visit new_log_path

      fill_in 'log[started_on]', with: Date.today
      fill_in 'log[ended_on]', with: Date.today
      # タグ付けがfill_inで出来ないので未実装

      # やったことフォーム
      fill_in 'log[dones_attributes][0][title]', with: 'やったことをここに書きました'
      fill_in 'log[dones_attributes][0][worktime]', with: 120
      fill_in 'log[dones_attributes][0][comment]', with: 'やったことの詳細'
      
      # わかったことフォーム
      fill_in 'log[knowledges_attributes][0][title]', with: 'わかったこと'
      fill_in 'log[knowledges_attributes][0][comment]', with: 'わかったことの詳細'

      # 次やることフォーム
      fill_in 'log[todos_attributes][0][title]', with: '次やること'
      fill_in 'log[todos_attributes][0][when_to_do]', with: Date.today + 3.days

      click_on '送信する'
    end

    context 'ログを送信した場合' do
      example '内容確認画面に遷移する' do
        expect(page).to have_text '確認画面'
      end
    end

    context '確認画面で送信ボタンを押したとき' do
      example 'ログが作成され、indexに遷移する' do
        click_on '送信'
        expect(page).to have_text 'やったことをここに書きました'
      end
    end

    context '確認画面で戻るボタンを押したとき' do
      example '値が保持されている' do
        click_on '戻る'
        have_xpath("//input[@id='log_dones_attributes_0_title'][@value='やったことをここに書きました']")
      end
    end

    context 'レベルアップに必要な経験値を満たした場合' do
      example 'レベルアップしました画面が表示される' do
        click_on '送信'
        expect(page).to have_css '#exampleModal'
      end
    end
  end

  describe 'ログ一覧画面' do
    before do
      visit logs_path
    end

    context '削除ボタンを押したとき' do
      example 'ログが削除される' do
        find('.fa-trash-alt').click
        expect(page).to have_text 'YWTを削除しました'
      end
    end

    context '編集ボタンを押したとき' do
      example 'ログ編集ページに遷移' do
        find('.fa-edit').click
        expect(current_path).to eq edit_log_path(@log.id)
      end
    end
  end
end