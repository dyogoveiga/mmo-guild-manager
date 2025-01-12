class CreateReputationHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :reputation_histories do |t|
      t.integer :value
      t.datetime :reference_at
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
