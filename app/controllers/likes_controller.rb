class LikesController < ApplicationController
  before_action :authorize_user
  
  def create
    current_user.like_post(like_params[:post_id])
    redirect_back_or_to root_path
  end

  def destroy
    current_user.unlike_post(params[:id])
    redirect_back_or_to root_path
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
