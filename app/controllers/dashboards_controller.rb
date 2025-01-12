class DashboardsController < BaseController
  def show
    @characters = Character.all
  end
end
