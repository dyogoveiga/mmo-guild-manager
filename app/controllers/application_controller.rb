class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :require_discord_user!

  private

  def require_discord_user!
    redirect_to root_path unless current_user
  end
end
