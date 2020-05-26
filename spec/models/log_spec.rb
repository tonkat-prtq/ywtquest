require 'rails_helper'

RSpec.describe 'Logs', type: :model do
  before do
    @user = create(:user)

    @log = create(:log, user: @user)

    @done = create(:done, log: @log)
    @knowledge = create(:knowledge, log: @log)
    @todo = create(:todo, log: @log)
  end

  describe 'Logのバリデーション' do
    context 'log自体のバリデーション' do
      example 'started_on <= ended_onであればOK' do
        expect(@log.started_on <= @log.ended_on).to eq(true)
      end

      example 'started_onとended_onが空でなければOK' do
        expect(@log.started_on.present? && @log.ended_on.present?).to eq(true)
      end
    end

    context 'やったこと(dones)のバリデーション' do
      example 'titleが空でなく、title,comment,worktimeの文字数制限に引っかからなければOK' do
        expect(@done.valid?).to eq(true)
      end

      example 'titleが空はNG' do
        @done.title = ""
        expect(@done.valid?).to eq(false)
      end

      example 'titleの文字数が255文字以上はNG' do
        @done.title = "qwerty" * 100
        expect(@done.valid?).to eq(false)
      end

      example 'commentの文字数が5000文字以上はNG' do
        @done.comment = "qwerty" * 900
        expect(@done.valid?).to eq(false)
      end

      example 'worktimeの文字数（桁数）が6以上はNG' do
        @done.worktime = 198619
        expect(@done.valid?).to eq(false)
      end
    end

    context 'わかったこと(knowledges)のバリデーション' do
      example 'titleが空でなく、title,commentの文字数制限に引っかからなければOK' do
        expect(@knowledge.valid?).to eq(true)
      end
    end


  end
end