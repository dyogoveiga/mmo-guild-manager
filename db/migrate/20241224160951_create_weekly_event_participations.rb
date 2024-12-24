class CreateWeeklyEventParticipations < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_event_participations do |t|
      t.references :character, null: false, foreign_key: true
      t.references :weekly_event, null: false, foreign_key: true
      t.string :status, default: 'waiting_approval'
      t.string :type

      t.timestamps
    end
  end
end
