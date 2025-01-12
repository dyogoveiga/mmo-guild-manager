class GearScoreHistory < ApplicationRecord
  belongs_to :character

  validates :value, presence: true
  validates :reference_at, presence: true

  after_create :update_character_gear_score

  private

  def update_character_gear_score
    character.update(gear_score: value)
  end
end
