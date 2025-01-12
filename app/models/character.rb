class Character < ActiveRecord::Base
  DEFAULT_GEAR_SCORE = 0

  belongs_to :user, optional: true, foreign_key: :discord_username, primary_key: :discord_username
  has_one :wallet, dependent: :destroy
  has_many :gear_score_histories, dependent: :destroy
  has_many :reputation_histories, dependent: :destroy

  validates :name, :discord_username, :role, :main_weapon, :off_hand, :member_since, presence: true
  validates :discord_username, uniqueness: true
  validates :name, uniqueness: true

  validate :validate_not_duplicate_weapon_name

  before_validation(
    :assign_member_since,
    :assign_gear_score,
  )

  before_save(
    :assign_klass_name
  )

  after_create(
    :create_wallet!
  )

  private

  def validate_not_duplicate_weapon_name
    return unless main_weapon == off_hand

    errors.add(:main_weapon, "can't be the same as off hand")
  end

  def assign_gear_score
    self.gear_score ||= DEFAULT_GEAR_SCORE
  end

  def assign_member_since
    self.member_since ||= Time.current
  end

  def assign_klass_name
    self.klass = Klass.by_weapon_names(main_weapon: main_weapon, offhand: off_hand).name
  end

  def create_wallet!
    Wallet.create(character: self)
  end
end
