class CreateRecurrentEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :recurrent_events do |t|
      t.string :name
      t.integer :hour
      t.integer :week_day
      t.string :type
      t.integer :bonification_value
      t.string :bonification_type
      t.boolean :optional, default: true

      t.timestamps
    end
  end
end
