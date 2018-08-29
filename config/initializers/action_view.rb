Rails.application.config.action_view.field_error_proc = proc do |html_tag, instance|
  if instance.is_a?(ActionView::Helpers::Tags::Label)
    html_tag.html_safe
  else
    "#{html_tag}<span class=\"help is-danger is-size-7\">#{instance.error_message.first}</span>".html_safe
  end
end
