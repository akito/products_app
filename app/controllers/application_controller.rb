class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  class Forbidden < ActionController::ActionControllerError; end

  rescue_from Forbidden, with: :rescue403

  def rescue403(e)
    @exception = e
    logger.error "error_403: #{e.message}"
    render 'errors/forbidden', status: 403
  end
end
