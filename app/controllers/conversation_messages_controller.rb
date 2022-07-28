class ConversationMessagesController < ApplicationController
  def create
    current_user.messages.create(conversation_id: params[:conversation], content: params[:content])
  end
end
