class Admin::DashboardController < Admin::ApplicationController
  def index
    @mating_apiaries = MatingApiary.all
    render "admin/mating_apiaries/index"
  end

end