class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :redirect, if: :user_signed_in?
  layout 'devise'

  def home; end

  private

  def redirect
    current_user.admin? ? redirect_to(admin_users_path) : redirect_to(dashboard_path)
  end
end
