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
      example 'やったことのtitleが空でなく、title,comment,worktimeの文字数制限に引っかからなければOK' do
        expect(@done.valid?).to eq(true)
      end

      example 'やったことのtitleが空はNG' do
        @done.title = ""
        expect(@done.valid?).to eq(false)
      end

      example 'やったことの文字数が255文字以上はNG' do
        @done.title = "qwerty" * 100
        expect(@done.valid?).to eq(false)
      end
    end

  end
end