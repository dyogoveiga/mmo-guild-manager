class WeeklyEvent < ApplicationRecord
  self.inheritance_column = nil

  belongs_to :weekly_schedule

  validates :name, presence: true
  validates :hour, presence: true
  validates :week_day, presence: true
  validates :type, presence: true
  validates :bonification_value, presence: true
  validates :bonification_type, presence: true
end
