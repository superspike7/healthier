class LikeNotification < Noticed::Base
  deliver_by :database

  param :post
  param :user
  param :like

  def user
    params[:user]
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
