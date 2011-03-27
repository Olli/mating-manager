class MatingApiariesController < ApplicationController
  def index
    @mating_apiaries = MatingApiary.approved
  end
  def show
    @mating_apiary = MatingApiary.approved.find(params[:id])
  end
  
end