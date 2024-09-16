class ApplicationController < ActionController::Base
  include Auth
  include InertiaFlash

  before_action :configure_permitted_parameters, if: :devise_controller?

  inertia_share auth: -> {
    if user_signed_in?
      {
        email: current_user.email,
      }
    end
  }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end