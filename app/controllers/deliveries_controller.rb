class DeliveriesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @mating_apiary = MatingApiary.approved.find(params[:maing_apiary])
    @delivery = @mating_apiary.deliverer.build(:user => current_user)
    @available_units = @mating_apiary.available_units
  end
end