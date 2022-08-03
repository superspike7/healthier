# To deliver this notification:
#
# ConversationNotification.with(post: @post).deliver_later(current_user)
# ConversationNotification.with(post: @post).deliver(current_user)

class ConversationNotification < Noticed::Base
  deliver_by :database

  # Add required params
  #
  param :conversation
  param :user

  # Define helper methods to make rendering easier.
  #
  def user_image
    # whatever the user image implementation
  end

  def title
    "#{params[:user].username} created a conversation with you."
  end

  def url
    direct_conversation_path(params[:conversation])
  end

  def body; end
end
