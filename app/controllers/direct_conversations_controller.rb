class DirectConversationsController < ApplicationController
  def index
    @users = User.all
    @conversations = current_user.conversations
  end

  def show
    @conversation_name = @conversation.show_conversation_name(current_user)
    @conversation_messages = @conversation.messages.includes(:user)
    @message = current_user.messages.build(conversation_id: params[:id])
    @conversation.notifications_as_conversation.mark_as_read!
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

  def update
    # update the conversation name
  end
end
