class DeliveriesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @mating_apiary = MatingApiary.approved.find(params[:mating_apiary_id])
    if params[:order].blank?
      @deliveries = @mating_apiary.deliveries.order('pickupdate')
    else
      @deliveries = @mating_apiary.deliveries.order_by(params[:order])
    end
  end
  def new
    @mating_apiary = MatingApiary.approved.find(params[:maing_apiary])
    @delivery = @mating_apiary.deliverer.build(:user => current_user)
    @available_units = @mating_apiary.available_units
  end

  def change_state
    @delivery = Delivery.find(params[:id])
    @delivery.change_state(params[:event])
  end
end