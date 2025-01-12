class ReputationHistory < ApplicationRecord
  belongs_to :character

  validates :value, presence: true
  validates :reference_at, presence: true
end
