class User < ApplicationRecord
  has_many :logs, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :logs, reject_if: :all_blank, allow_destroy: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable,
         :omniauthable, omniauth_providers: %i(google)
  validates :name, length: {maximum: 30}
  validates :profile, length: {maximum: 255}
  has_many :dones, through: :logs
  has_many :knowledges, through: :logs
  has_many :todos, through: :logs

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
        name: auth.info.name,
        email: auth.info.email,
        provider: auth.provider,
        uid:      auth.uid,
        password: Devise.friendly_token[0, 20],
      )
    end
    # skip_confirmationでGoogle認証のときはメール送信しない
    user.skip_confirmation! 
    user.save
    user
  end
end
