class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = User.find(current_user)
    redirect_to edit_user_path(@user) if @user.last_name.blank? 

  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = I18n.t(:signed_up,:scope => :usermanagement) + "!"
    else
      render "new"
    end
  end
  def edit
    @user = User.find(current_user)
  end
  def update
    @user = User.find(current_user)
    @user.update_attributes(params[:user])
    if @user.save
      flash[:notice] = t(:successful_updated)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
  def delete
    @user = User.find(current_user)
    @user.destroy
    flash[:notice] = t(:successful_deleted)
    redirect_to log_out_path
  end
end
