module ApplicationHelper
  APP_NAME = "Products APP"

  def page_title
    base_title = APP_NAME
    return base_title if @product.blank?
    "#{base_title} | #{@product.name}"
  end

  def flash_message(message, klass)
    content_tag(:div, class: "klass") do
    end
  end
end
