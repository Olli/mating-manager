class Admin::MatingUnitsController < Admin::AdminBaseController
  def index
    @mating_units = MatingUnit.all
  end
  def new
    @mating_unit = MatingUnit.new
  end
  def create
    @mating_unit = MatingUnit.create(params[:mating_unit])
  end
  def edit
    @mating_unit = MatingUnit.find(params[:id])
  end
  def update
    @mating_unit = MatingUnit.find(params[:id])
    @mating_unit.update_attributes(params[:mating_unit])
    if @mating_unit.save
      flash[:notice] = t(:successful_updated)
    end
  end

end