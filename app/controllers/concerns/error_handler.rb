module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Forbidden, with: :rescue403
  end
  def rescue403(e)
    @exception = e
    logger.error "error_403: #{e.message}"
    render 'errors/forbidden', status: 403
  end
end
