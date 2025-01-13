class DynamicEventParticipation < ApplicationRecord
  STATUSES = [
    "waiting_approval",
    "approved",
    "rejected"
  ].freeze

  MODES = [
    "PvE",
    "PvP"
  ].freeze

  EVENT_NAMES = [
    "Aikidu: Valley"
  ].freeze

  belongs_to :character

  validates :event_name, presence: true
  validates :mode, presence: true
  validates :status, presence: true
  validates :discord_image_url, presence: true

  after_initialize do
    self.status ||+ "waiting_approval"
  end
end
