class DirectConversationsController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id).includes([:avatar_attachment])
    @conversations = current_user.conversations
  end

  def show
    @users = User.where.not(id: current_user.id).includes([:avatar_attachment])
    @conversation = current_user.conversations.find(params[:id])
    @other_user = @conversation.members.last.user_id
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
    redirect_back_or_to root_url, alert: 'Something went wrong. Please try again later.'
  end
end
