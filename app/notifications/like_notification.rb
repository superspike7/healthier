# To deliver this notification:
#
# LikeNotification.with(post: @post).deliver_later(current_user)
# LikeNotification.with(post: @post).deliver(current_user)

class LikeNotification < Noticed::Base
  deliver_by :database

  param :post
  param :user
  param :like

  def user_image
    # whatever the user image implementation
  end

  def username
    params[:user].username
  end

  def title
    'liked your post'
  end

  def body; end

  def url
    post_path(params[:post])
  end
end
