class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  class Forbidden < StandardError; end

  rescue_from Forbidden, with: :rescue403

  def rescue403(e)
    @exception = e
    logger.error "error_403: #{e.message}"
    render 'errors/forbidden', status: 403
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
