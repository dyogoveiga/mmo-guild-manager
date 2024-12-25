class CreateDynamicEventParticipations < ActiveRecord::Migration[7.2]
  def change
    create_table :dynamic_event_participations do |t|
      t.references :character, null: false, foreign_key: true
      t.string :discord_image_url
      t.string :status, default: 'waiting_approval'
      t.string :event_name
      t.string :mode

      t.timestamps
    end
  end
end
