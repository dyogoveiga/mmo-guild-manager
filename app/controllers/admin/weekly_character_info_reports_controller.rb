class Admin::WeeklyCharacterInfoReportsController < Admin::BaseController
  def new
    @report = WeeklyCharacterInfoReport.new
    Character.all.map do |character|
      @report.weekly_character_info_report_items.build(character: character)
    end
  end
end
