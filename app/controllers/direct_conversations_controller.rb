class DirectConversationsController < ApplicationController
  before_action :authorize_user

  def index
    @conversations = current_user.conversations.recent
    @new_conversations = current_user.new_conversations.includes([:avatar_attachment])
  end

  def show
    @conversations = current_user.conversations.recent
    @new_conversations = current_user.new_conversations.includes([:avatar_attachment])
    
    @conversation = current_user.conversations.find(params[:id])
    @other_user = @conversation.members.other_user(current_user)
    @conversation_messages = @conversation.messages.includes(:user)
    @message = current_user.messages.build(conversation_id: params[:id])
    @conversation.mark_as_read(current_user)
  end

  def create
    other_user = User.find(params[:other_user])
    conversation = current_user.existing_conversation_with(other_user) ||
                   Conversation.create_direct!(current_user, other_user)
    redirect_to direct_conversation_url(conversation)
  rescue ActiveRecord::Rollback
    redirect_back_or_to dashboard_url, alert: 'Something went wrong. Please try again later.'
  end
end
