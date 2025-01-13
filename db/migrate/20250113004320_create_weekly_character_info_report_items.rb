class CreateWeeklyCharacterInfoReportItems < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_character_info_report_items do |t|
      t.references :weekly_character_info_report, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
      t.integer :gear_score
      t.integer :reputation
      t.integer :kill_ranking
      t.string :activity_ranking
      t.integer :kills
      t.integer :assists

      t.timestamps
    end
  end
end
