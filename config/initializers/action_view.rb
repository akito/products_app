Rails.application.config.action_view.field_error_proc = Proc.new do |html_tag, instance|
  if instance.kind_of?(ActionView::Helpers::Tags::Label)
    html_tag.html_safe
  else
    # TODO: Style適応
    "#{html_tag}<span class=\"help is-danger is-size-7\">#{instance.error_message.first}</span>".html_safe
  end
end
