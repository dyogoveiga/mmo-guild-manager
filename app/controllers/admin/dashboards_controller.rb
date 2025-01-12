class Admin::DashboardsController < Admin::BaseController
  def show
    @characters = Character.all.order(:name)
  end
end
