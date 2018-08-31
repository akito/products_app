module ApplicationHelper
  APP_NAME = "Product Stash".freeze

  def page_title
    base_title = APP_NAME
    return base_title if @product.blank? || @product.name.blank?
    "#{base_title} | #{@product.name}"
  end

  def flash_message(_message, _klass)
    content_tag(:div, class: "klass") do
    end
  end
end
