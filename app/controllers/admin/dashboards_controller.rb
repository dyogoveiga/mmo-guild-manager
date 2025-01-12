class Admin::DashboardsController < Admin::BaseController
  def show
    @characters = Character.all
  end
end
