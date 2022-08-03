# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  deliver_by :database

  # Add required params
  param :post
  param :user

  # Define helper methods to make rendering easier.
  def user_image
    # whatever the user image implementation
  end

  def message
    "#{params[:user].username} commented on your post."
  end

  def url
    post_path(params[:post])
  end
end