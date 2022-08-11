class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user, if: :user_signed_in?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  def after_sign_in_path_for(_resource)
    if current_user.admin?
      admin_users_path
    else
      root_url
    end
  end

  def set_current_user
    Current.user = current_user
  end

  def authorize_admin
    not_found unless current_user.admin?
  end

  def authorize_user
    not_found if current_user.admin?
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
