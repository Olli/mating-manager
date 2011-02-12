class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = I18n.t('usermanagement.signed_up') + "!"
    else
      render "new"
    end
  end

end
