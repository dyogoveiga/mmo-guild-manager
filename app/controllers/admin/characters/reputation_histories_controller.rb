class Admin::Characters::ReputationHistoriesController < Admin::BaseController
  before_action :load_character!

  def index
    @reputation_histories = @character.reputation_histories
  end

  def new
    @reputation_history = ReputationHistory.new(
      character: @character
    )
  end

  def create
    @reputation_history = ReputationHistory.new(reputation_history_create_params)

    if @reputation_history.save
      redirect_to admin_character_reputation_histories_path(@character)
    else
      render :new
    end
  end

  private

  def reputation_history_create_params
    params.require(:reputation_history).permit(
      :value,
      :reference_at
    ).merge(character: @character)
  end

  def load_character!
    @character ||= Character.find(params[:character_id])
  end
end
