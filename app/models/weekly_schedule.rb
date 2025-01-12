class WeeklySchedule < ApplicationRecord
  validates :start_at, :end_at, presence: true
  has_many :weekly_events, dependent: :destroy

  after_create :create_week_events!

  private

  def create_week_events!
    RecurrentEvent.all.each do |event|
      scheduled_at = start_at + (event.week_day - 1).days + event.hour.hours

      WeeklyEvent.create!(
        name: event.name,
        hour: event.hour,
        week_day: event.week_day,
        type: event.type,
        bonification_value: event.bonification_value,
        bonification_type: event.bonification_type,
        weekly_schedule: self,
        optional: false,
        scheduled_at: scheduled_at
      )
    end
  end
end
