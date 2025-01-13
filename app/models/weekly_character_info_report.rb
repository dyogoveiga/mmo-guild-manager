class WeeklyCharacterInfoReport < ApplicationRecord
  has_many :weekly_character_info_report_items, dependent: :destroy

  accepts_nested_attributes_for :weekly_character_info_report_items, allow_destroy: true
end
