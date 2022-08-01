class DirectConversationsController < ApplicationController
  before_action :set_direct_conversation, only: %i[show edit update]
  before_action :set_logged_in_user, only: %i[index show]

  def index
    @users = User.all
    @conversations = current_user.conversations.recent
    @notifications = current_user.notifications
  end

  def show
    @conversation_messages = @conversation.messages.includes(:user)
    @message = current_user.messages.build(conversation_id: params[:id])
    @conversation.mark_as_read(current_user)
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

  def set_logged_in_user
    @logged_in_user = current_user
  end
end
