class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  include ErrorHandler

  protected
    def configure_permitted_parameters
      added_attrs = [:name, :email, :password, :passwoed_confirmation, :remember_me, :avatar]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    def authenticate_admin_user!
      raise Forbidden unless current_user&.admin?
    end
end
