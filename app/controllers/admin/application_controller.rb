class Admin::ApplicationController < ApplicationController
  layout 'admin'
  before_filter :title
  
  protected
    def title
      set_title(I18n.t(self.controller_name.to_sym, :scope => :controller))
    end
end