class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  include ErrorHandler

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def authenticate_admin_user!
      raise Forbidden unless current_user.try(:admin?)
    end
end
