# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  deliver_by :database

  # Add required params
  param :post
  param :user
  param :comment

  # Define helper methods to make rendering easier.
  def user_image
    # whatever the user image implementation
  end

  def title
    "#{params[:user].username} commented on your post."
  end

  def body
    params[:comment].body
  end

  def url
    post_path(params[:post])
  end
end
