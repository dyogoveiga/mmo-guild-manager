class DashboardsController < BaseController
  def show
    @characters = Character.all.order(:name)
  end
end
