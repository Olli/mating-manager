class Admin::UsersController < Admin::AdminBaseController
  respond_to :html

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
      flash[:notice] = I18n.t(:successful_created)
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
      flash[:notice] = I18n.t(:successful_updated)
    end
    respond_with @user
  end
  def delete
    @user = User.find(params[:id])
    if  @user.destroy
      flash[:notice] = I18n.t(:successful_deleted)
    end
    respond_with @user
  end

end
