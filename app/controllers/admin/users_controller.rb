class Admin::UsersController < Admin::ApplicationController
  respond_to :html
  before_filter :set_title 
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(params[:user])    
    if @user.save
      flash[:notice] = I18n.t(:successful_created, :scope => :usermanagement)
    end
    respond_with @user
    
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    if @user.save
      flash[:notice] = I18n.t(:successful_updated, :scope => :usermanagement)
    end
    respond_with @user
  end
  def delete
    @user = User.find(params[:id])
    if  @user.destroy
      flash[:notice] = I18n.t(:successful_destroyed, :scope => :usermanagement)
    end
    respond_with @user
  end
  
end
