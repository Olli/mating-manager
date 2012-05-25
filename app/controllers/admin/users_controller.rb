class Admin::UsersController < Admin::AdminBaseController
  respond_to :html
  before_filter :find_user, only: [:show,
                                   :edit,
                                   :update,
                                   :delete
                                  ]

  def index
    @users = User.all
  end
  def show
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
  end
  def update
    @user.update_attributes(params[:user])
    if @user.save
      flash[:notice] = I18n.t(:successful_updated)
    end
    respond_with @user
  end
  def delete
    if  @user.destroy
      flash[:notice] = I18n.t(:successful_deleted)
    end
    respond_with @user
  end
  protected
    def find_user
      @user = User.find(params[:id])
    end

end
