class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable,
         :omniauthable, omniauth_providers: %i(google_oauth2)
  def self.create_unique_string # ランダムなuidを作成する
    SecureRandom.uuid
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

  # 以下を追加
    # def self.from_omniauth(access_token)
    #   data = access_token.info
    #   user = User.where(email: data['email']).first

    #   # Uncomment the section below if you want users to be created if they don't exist
    #   unless user
    #       user = User.create(name: data['name'],
    #         email: data['email'],
    #         password: Devise.friendly_token[0,20]
    #       )
    #   end
    #   user
    # end
end
