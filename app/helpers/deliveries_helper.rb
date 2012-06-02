module DeliveriesHelper
  def show_state(state)
    case state
    when :requested
      t('delivery.state.requested')
    when :accepted
      t('delivery.state.accepted')
    when :denied
      t('delivery.state.denied')
    when :archived
      t('delivery.state.archived')
    end
  end
  def state_dropdown(delivery)
    content_tag :div, class: 'btn-group' do
      linktext = "<span class=\"delivery_state\">#{ show_state(delivery.state.to_sym) }</span><span class=\"caret\"></span>"
      link_to(raw(linktext),
              "#",
              class: 'btn dropdown-toggle',
              'data-toggle' => 'dropdown') +
      content_tag(:ul, class: 'dropdown-menu') do
        states = ""
        delivery.aasm_events_for_current_state.collect { |e,c| e }.each do |aasm_event|
          changelink = link_to t(aasm_event,:scope => 'delivery.event'),
                               change_state_admin_delivery_path(delivery,:event => aasm_event),
                               remote: true

          states += content_tag :li, changelink
        end
        states.html_safe
      end
    end
  end
end