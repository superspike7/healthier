module ConversationMessagesHelper
  def message_status(id)
    id == params[:id].to_i ? "bg-gray-200" : ""
  end
end
