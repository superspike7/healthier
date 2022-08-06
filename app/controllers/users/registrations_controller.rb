# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  layout "application", only: :edit
  before_action :restrict_google_user, only: :edit

  private

  def restrict_google_user
    unless current_user.provider.nil?
      flash[:notice] = 'Google Accounts cannot edit their email and password.'
      redirect_back_or_to root_url
    end
  end
end
