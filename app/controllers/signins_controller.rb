class SigninsController < ApplicationController
  layout "page"

  skip_before_action :require_discord_user!

  before_action :redirect_logged_user!

  def show
  end

  private

  def redirect_logged_user!
    redirect_to dashboard_path if current_user
  end
end
