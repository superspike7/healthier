class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)

    if @comment.add(sender: current_user, receiver: post.user)
      post.mark_post_activities_as_read(current_user)
      redirect_to post_path(post)
    else
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy_including_notifications
    redirect_back_or_to root_path, notice: 'Successfully deleted your comment.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
