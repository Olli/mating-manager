##
# manage mating apiary
# a ordinary user (role deliverer) should only can list view approved apiaries
# a apiary manager (role manager) should can edit his own apiary and and see
# other approved

class MatingApiariesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_mating_apiary, only: [:show, :edit, :update, :destroy]
  before_filter :is_allowed?, only: [:edit, :update, :destroy]
  def index
    if current_user.has_role? :admin
      @mating_apiaries = MatingApiary.all
    else
      @mating_apiaries = MatingApiary.approved
    end
  end
  def show

  end
  def new
    @mating_apiary = MatingApiary.new
  end

  def edit

  end

  def create
    @mating_apiary = MatingApiary.create(params[:mating_apiary])
    @mating_apiary.user = current_user
    if @mating_apiary.errors.blank?
      flash[:notice] = I18n.t(:created, :scope => :mating_apiary)
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def update
    @mating_apiary.update_attributes(params[:mating_apiary])
    if @mating_apiary.save
      flash[:notice] = I18n.t(:updated, :scope => :mating_apiary)
      redirect_to action: "show"
    else
      render 'new'
    end
  end

  def destroy

    @mating_apiary.destroy
  end

  private
    def find_mating_apiary
      @mating_apiary = MatingApiary.approved.find(params[:id])
    end

    def is_allowed?
      unless current_user.is_manager_of? @mating_apiary or current_user.is_admin?
        redirect_to mating_apiary_path(@mating_apiary)
      end
    end

end