class MatingApiariesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_mating_apiary, only: [:show, :edit, :update, :destroy]
  def index
    if user.has_role? :admin
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
    @mating_apiary = MatingApiary.create(params[:mating_apiary])
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
      @mating_apiary = MatingApiary.approved
    end

end