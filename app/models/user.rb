class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :discord ]

  def self.from_omniauth(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.email = auth.info.email
    user.discord_image_url = auth.info.image

    unless user.persisted?
      user.discord_username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end

    user.save
    user
  end
end
