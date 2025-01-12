class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [ :discord ]

  has_one :character, foreign_key: :discord_username, primary_key: :discord_username

  before_create :set_role

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

  def admin?
    role == "admin"
  end

  private

  def set_role
    self.role = "member"
  end
end
