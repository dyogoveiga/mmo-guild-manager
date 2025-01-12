class CreateWeeklySchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_schedules do |t|
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
