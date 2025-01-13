class BaseController < ApplicationController
  before_action :require_character!

  def current_character
    @current_character ||= current_user.character
  end

  private

  def require_character!
    redirect_to new_character_path if current_user.character.nil?
  end
end
