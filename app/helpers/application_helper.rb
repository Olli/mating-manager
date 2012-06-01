module ApplicationHelper
  def link_to_close(element = 'this', linktext = t('remove'))
     link_to_function linktext,
                      "$(#{element}).parent().fadeOut(function() { $(this).remove() })",
                      class: 'btn btn-danger'
  end

end
