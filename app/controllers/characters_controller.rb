class CharactersController < BaseController
  skip_before_action :require_character!

  before_action :check_current_user_character!

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_create_params)

    if @character.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def character_create_params
    received_params = params.require(:character).permit(:name, :role, :main_weapon, :off_hand).to_h
    received_params.merge(
      discord_username: current_user.discord_username
    )
  end

  def check_current_user_character!
    redirect_to dashboard_path if current_user.character
  end
end
