class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user, if: :user_signed_in?
  before_action :configure_permitted_parameters,
    if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  private

  def set_current_user
    Current.user = current_user
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
