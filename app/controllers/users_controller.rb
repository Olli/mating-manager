class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = I18n.t(:signed_up,:scope => :usermanagement) + "!"
    else
      render "new"
    end
  end

end
