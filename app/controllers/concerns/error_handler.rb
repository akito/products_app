module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Forbidden, with: :rescue403
  end

  def rescue403(e)
    logger.error "error_403: #{e.message}"
    render file: "public/403.html", status: :forbidden
  end
end
