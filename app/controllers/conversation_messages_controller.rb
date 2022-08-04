class ConversationMessagesController < ApplicationController
  def create
    message = current_user.messages.build(conversation_message_params)
    message.send_message_with_notification
    conversation = current_user.conversations.find(params[:conversation])
    conversation.mark_as_read(current_user)
    redirect_to direct_conversation_url(conversation)
  end

  private

  def conversation_message_params
    params.require(:message).permit(:content).merge(conversation_id: params[:conversation])
  end
end
