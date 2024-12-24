class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :gear_score
      t.string :discord_username
      t.string :role
      t.string :main_weapon
      t.string :off_hand
      t.string :klass
      t.date :member_since
      t.string :invited_by

      t.timestamps
    end

    add_index :characters, [ :name, :discord_username ], unique: true
  end
end
