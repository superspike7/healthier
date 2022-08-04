class CommentNotification < Noticed::Base
  deliver_by :database

  param :post
  param :user
  param :comment

  def user
    params[:user]
  end

  def username
    params[:user].username
  end

  def title
    'commented on your post'
  end

  def body
    params[:comment].body
  end

  def url
    post_path(params[:post])
  end
end
