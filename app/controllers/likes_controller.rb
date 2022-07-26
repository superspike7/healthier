class LikesController < ApplicationController
  before_action :authorize_user

  def create
    current_user.like_post(params[:post])
    redirect_back_or_to dashboard_path
  end

  def destroy
    current_user.unlike_post(params[:id])
    redirect_back_or_to dashboard_path
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
