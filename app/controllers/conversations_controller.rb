class ConversationsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @conversation_id = params[:id]
    @conversation_messages = Message.where(conversation: @conversation_id)
    @message = current_user.messages.build(conversation_id: @conversation_id)
  end

  def create
    # link to access the conversation.
    # ?other_user=1
    other_user = User.find(params[:other_user])
    conversation = current_user.existing_conversation_with(other_user) ||
                   Conversation.create_direct!(current_user, other_user)
    redirect_to conversation_url(conversation)
  rescue ActiveRecord::Rollback
    redirect_back_or_to root_url, alert: 'Something went wrong. Please try again later.'
  end
end
