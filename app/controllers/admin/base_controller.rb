class Admin::BaseController < ApplicationController
  before_action :require_admin!

  private

  def require_admin!
    redirect_to dashboard_path unless current_user.admin?
  end
end
