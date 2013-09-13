class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation)}
  end
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

end

