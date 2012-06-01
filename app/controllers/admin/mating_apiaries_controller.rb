class Admin::MatingApiariesController < Admin::AdminBaseController
  before_filter :find_mating_apiary, only: [:edit, :update, :destroy]
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
  end
  def update
    @mating_apiary.update_attributes(params[:mating_apiary])
    if @mating_apiary.errors.blank?
      flash[:notice] = I18n.t(:updated, :scope => :mating_apiary)
      redirect_to :action => "index"
    else
      render 'edit'
    end
  end
  def destroy
    @mating_apiary.destroy
  end
  protected
    def find_mating_apiary
      @mating_apiary = MatingApiary.find(params[:id])
    end
end