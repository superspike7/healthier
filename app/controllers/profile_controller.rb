class ProfileController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(profile_params)
    redirect_to profile_url, notice: 'Successfully edited your profile.'
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :avatar)
  end
end
