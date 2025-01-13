class CreateWeeklyCharacterInfoReports < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_character_info_reports do |t|
      t.datetime :reference_at

      t.timestamps
    end
  end
end
