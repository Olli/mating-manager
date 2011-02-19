module Admin::ApplicationHelper
  def set_title(page_title)
    content_for :title do
      page_title
    end
  end  
end