class CreateWeeklyEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_events do |t|
      t.string :name
      t.date :scheduled_at
      t.integer :hour
      t.string :week_day
      t.string :type
      t.integer :bonification_value
      t.string :bonification_type
      t.boolean :optional, default: true
      t.references :weekly_schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
