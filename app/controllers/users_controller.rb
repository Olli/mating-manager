##
# a user can manage his own account
class UsersController < ApplicationController
  respond_to :html
  before_filter :find_user, only: [:show,
                                   :edit,
                                   :update,
                                   :delete
                                  ]
  def show
    redirect_to edit_user_path(@user) if @user.last_name.blank?
  end
  def edit
  end
  def update
    if params[:user][:password].blank?
      params[:user].delete :current_password
      @user.update_without_password(params[:user])
    else
      @user.update_with_password(params[:user])
    end
    if @user.save
      flash[:notice] = t(:successful_updated)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
  def destroy
    @user.destroy
    flash[:notice] = t(:successful_deleted)
    redirect_to log_out_path
  end
  protected
    def find_user
      @user = User.find(current_user)
    end

end
