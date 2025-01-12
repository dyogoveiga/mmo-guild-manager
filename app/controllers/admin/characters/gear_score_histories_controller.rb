class Admin::Characters::GearScoreHistoriesController < Admin::BaseController
  before_action :load_character!

  def index
    @gear_score_histories = @character.gear_score_histories
  end

  def new
    @gear_score_history = GearScoreHistory.new(
      character: @character
    )
  end

  def create
    @gear_score_history = GearScoreHistory.new(gear_score_history_create_params)

    if @gear_score_history.save
      redirect_to admin_character_gear_score_histories_path(@character)
    else
      render :new
    end
  end

  private

  def gear_score_history_create_params
    params.require(:gear_score_history).permit(
      :value,
      :reference_at
    ).merge(character: @character)
  end

  def load_character!
    @character ||= Character.find(params[:character_id])
  end
end
