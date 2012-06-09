class FatherLinesController < ApplicationController
  load_and_authorize_resource

  def create
    @father_line = FatherLine.create(params[:father_line])
    @father_line.mating_apiary = current_user.mating_apiary
    @father_line.save
  end
  def update
    @father_line.update_attributes params[:father_line]
    @father_line.mating_apiary = current_user.mating_apiary
    @father_line.save
  end

end