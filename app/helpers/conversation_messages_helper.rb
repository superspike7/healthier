module ConversationMessagesHelper
  def message_status(user_id)
    user_id == @other_user ? "bg-gray-200" : ""
  end
end
