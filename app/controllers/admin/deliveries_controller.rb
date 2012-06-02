class Admin::DeliveriesController < ApplicationController
  def change_state
    @delivery = Delivery.find(params[:id])
    @delivery.change_state(params[:event])
  end
end
