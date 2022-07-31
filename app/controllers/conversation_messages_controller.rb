class ConversationMessagesController < ApplicationController
  def create
    current_user.messages.create(conversation_message_params)
    conversation = current_user.conversations.find(params[:conversation])
    conversation.mark_as_read(current_user)
  end

  private

  def conversation_message_params
    params.require(:message).permit(:content).merge(conversation_id: params[:conversation])
  end
end
