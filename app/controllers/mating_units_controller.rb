class MatingUnitsController < ApplicationController
  before_filter :find_mating_unit, only: [:edit,:update,:destroy]
  def index
    @mating_units = MatingUnit.all
  end
  def new
    @mating_unit = MatingUnit.new
  end
  def create
    @mating_unit = MatingUnit.create(params[:mating_unit])
    if @mating_unit.errors.any?
      render "new"
    else
      redirect_to action: "index"
    end
  end
  def edit
  end
  def update
    @mating_unit.update_attributes(params[:mating_unit])
    if @mating_unit.save
      flash[:notice] = t(:successful_updated)
      redirect_to :action => "index"
    else
      render 'edit'
    end
  end
  def destroy
    @mating_unit.destroy
  end
  protected
    def find_mating_unit
      @mating_unit = MatingUnit.find(params[:id])
    end

end