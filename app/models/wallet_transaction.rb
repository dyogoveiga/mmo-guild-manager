class WalletTransaction < ApplicationRecord
  TYPES = %w[
    reputation
    score_bonus_pve_content
    score_bonus_pvp_content
    boonstone_defense
    riftstone_defense
    siege_fight
    boss_prime_time
    archboss_alliance_time
    dynamic_pve_event
    dynamic_pvp_event
    recruitment_event
    manual_ajustment
  ].freeze

  belongs_to :wallet

  validates :amount, presence: true
  validates :type, presence: true
  validates :reason, presence: true, if: :manual_ajustment?

  def manual_ajustment?
    type == "manual_ajustment"
  end
end
