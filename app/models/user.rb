class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable,
         :omniauthable, omniauth_providers: %i(google)
  def self.create_unique_string # ランダムなuidを作成する
    SecureRandom.uuid
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password) # params.delete(:current_password)でcurrent_passwordのパラメータ削除
    if params[:password].blank? && params[:password_confirmation].blank? # パスワード変更のためのパスワード入力フィールドとその確認フィールドの両者とも空の場合のみ、パスワードなしで更新できるように
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    unless user
      user = User.new(
        email: auth.info.email,
        provider: auth.provider,
        uid:      auth.uid,
        password: Devise.friendly_token[0, 20],
      )
    end
    user.save
    user
  end
end
