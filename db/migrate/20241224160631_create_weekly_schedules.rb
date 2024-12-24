class CreateWeeklySchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_schedules do |t|
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
