class LikesController < ApplicationController
  def create
    like = current_user.likes.create(like_params)
    post = Post.find(like_params[:post_id])
    LikeNotification.with(like:, post:, user: current_user).deliver_later(post.user)
    redirect_back_or_to root_path
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy
    like.notifications_as_like.destroy_all
    redirect_back_or_to root_path
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
