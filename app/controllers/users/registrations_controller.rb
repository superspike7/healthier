# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :restrict_google_user, only: :edit

  private

  def restrict_google_user
    raise ActionController::RoutingError, 'Not Found' unless current_user.provider.nil?
  end
end
