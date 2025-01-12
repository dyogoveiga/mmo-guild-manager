class Admin::CharactersController < Admin::BaseController
  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_create_params)

    if @character.save
      redirect_to admin_path
    else
      render :new
    end
  end

  private

  def character_create_params
    params.require(:character).permit(
      :name,
      :role,
      :main_weapon,
      :off_hand,
      :discord_username,
      :member_since
    ).to_h
  end
end
