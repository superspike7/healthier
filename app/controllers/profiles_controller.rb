class ProfilesController < ApplicationController
  def show
    @user = User.find_by!(username: params[:username])
    @posts = @user.posts.with_attachments_and_user.show_latest
    @follow = current_user.relationships.find_by(followed_id: @user.id)
    @follower_count = Relationship.follower_count(@user)
    @following_count = Relationship.following_count(@user)
  end

  def edit
    # @user = current_user
  end

  def update
    # current_user.update(profile_params)
    redirect_to profile_url, notice: 'Successfully edited your profile.'
  end

  private

  def profile_params
    params.require(:profile).permit(:username, :avatar)
  end
end
