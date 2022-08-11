class ProfilesController < ApplicationController
  before_action :authorize_user, :set_user

  def show
    @user = User.find_by!(username: params[:username])
    @posts = @user.posts.with_attachments_and_user.show_latest
    @follow = current_user.relationships.find_by(followed_id: @user.id)
    @follower_count = Relationship.follower_count(@user)
    @following_count = Relationship.following_count(@user)
  end

  def edit
    @user = User.find_by!(username: params[:username])
    not_found unless current_user == @user
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_url, notice: 'Successfully edited your profile.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by!(username: params[:username])
  end

  def profile_params
    params.require(:profile).permit(:username, :avatar)
  end
end
