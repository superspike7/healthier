class DirectConversationsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # pag inaccess na to ni user, all messages will be marked as 'read'
    @conversation_id = params[:id]
    @conversation = current_user.conversations.find(@conversation_id)
    @conversation_messages = current_user.messages.where(conversation: @conversation_id)
    @message = current_user.messages.build(conversation_id: @conversation_id)
  end

  def create
    # ?other_user=1
    other_user = User.find(params[:other_user])
    conversation = current_user.existing_conversation_with(other_user) ||
                   Conversation.create_direct!(current_user, other_user)
    redirect_to direct_conversation_url(conversation)
  rescue ActiveRecord::Rollback
    redirect_back_or_to root_url, alert: 'Something went wrong. Please try again later.'
  end
end
