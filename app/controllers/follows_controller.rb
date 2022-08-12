class FollowsController < ApplicationController
  before_action :authorize_user

  def create
    @follow = current_user.relationships.new(follow_params)
    unless @follow.save
      flash[:notice] = @follow.errors.full_messages.to_sentence
    end

    redirect_back_or_to dashboard_path
  end

  def destroy
    @follow = current_user.relationships.find_by(followed_id: params[:id])
    @follow.destroy
    redirect_back_or_to dashboard_path
  end

  private

  def follow_params
    params.require(:relationship).permit(:followed_id)
  end
end
