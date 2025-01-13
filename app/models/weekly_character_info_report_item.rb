class WeeklyCharacterInfoReportItem < ApplicationRecord
  belongs_to :weekly_character_info_report
  belongs_to :character
end
