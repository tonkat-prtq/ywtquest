require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
    @second_user = build(:second_user)
  end

  describe 'userのバリデーション' do
    example 'name, email, passwordがどれも空文字でない' do
      expect(@user.valid?).to eq(true)
    end

    example 'nameが30文字以上だとNG' do
      @user.name = "qwerty" * 7
      expect(@user.valid?).to eq(false)
    end

    example 'emailが空だとNG' do
      @user.email = ""
      expect(@user.valid?).to eq(false)
    end

    example 'emailがemailの形式でないとNG' do
      @user.email = "qwertyqwerty"
      expect(@user.valid?).to eq(false)
    end

    example 'emailがuniqueでないとNG' do
      @user.email = "sample1@example.com"
      @user.save
      @second_user.email = "sample1@example.com"
      expect(@second_user.save).to be_falsey # admin_userのemailが@userと同じもので、saveする際に引っかかることをチェックしている
    end

    example 'passwordが空だとNG' do
      @user.password = ""
      expect(@user.save).to be_falsey
    end

    example 'passwordが6文字より少ないとNG' do
      @user.password = "qwertyq"
      expect(@user.valid?).to eq(false)
    end
  end
end
