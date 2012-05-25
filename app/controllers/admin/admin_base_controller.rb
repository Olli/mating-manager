class Admin::AdminBaseController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!



end