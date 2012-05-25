class Admin::MatingApiariesController < Admin::AdminBaseController
  def index
    @mating_apiaries = MatingApiary.all
  end
  def new
    @mating_apiary = MatingApiary.new
  end
  def create
    @mating_apiary = MatingApiary.create(params[:mating_apiary])
    if @mating_apiary.errors.blank?
      flash[:notice] = I18n.t(:created, :scope => :mating_apiary)
      redirect_to :action => "index"
    else
      render 'new'
    end
  end
  def edit
    @mating_apiary = MatingApiary.find(params[:id])
  end
  def update
    @mating_apiary = MatingApiary.find(params[:id])
    @mating_apiary.update_attributes(params[:mating_apiary])
    if @mating_apiary.errors.blank?
      flash[:notice] = I18n.t(:created, :scope => :mating_apiary)
      redirect_to :action => "index"
    else
      render 'edit'
    end
  end
  def delete
    @mating_apiary = MatingApiary.find(params[:id])
    @mating_apiary.destroy
  end
end