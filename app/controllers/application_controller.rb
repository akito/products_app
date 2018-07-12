class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  include ErrorHandler
  #
  # rescue_from SecurityError do |exception|
  #   redirect_to root_url, notice: 'アドミン画面へのアクセス権がありません'
  # end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  #
  # def authenticate_admin_user!
  #   raise SecurityError unless current_user.try(:admin?)
  # end
end
