class RecurrentEvent < ApplicationRecord
  self.inheritance_column = nil

  validates :name, presence: true
  validates :hour, presence: true
  validates :week_day, presence: true
  validates :type, presence: true
  validates :bonification_value, presence: true
  validates :bonification_type, presence: true
end
