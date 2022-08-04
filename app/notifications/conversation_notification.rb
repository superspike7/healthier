class ConversationNotification < Noticed::Base
  deliver_by :database

  param :conversation
  param :user

  def user
    params[:user]
  end

  def username
    params[:user].username
  end

  def title
    'created a conversation with you'
  end

  def url
    direct_conversation_path(params[:conversation])
  end

  def body; end
end
