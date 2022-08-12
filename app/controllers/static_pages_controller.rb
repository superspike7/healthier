class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'devise'

  def home; end

  private

  def redirect_if_signed_in
    current_user.admin? ? redirect_to(admin_users_path) : redirect_to(dashboard_path)
  end
end
