class DirectConversationsController < ApplicationController
  before_action :set_direct_conversation, only: %i[show edit update]

  def index
    @users = User.all
  end

  def show
    @conversation_name = @conversation.show_conversation_name(current_user)
    @conversation_messages = @conversation.messages.includes(:user)
    @message = current_user.messages.build(conversation_id: params[:id])
  end

  def create
    other_user = User.find(params[:other_user])
    conversation = current_user.existing_conversation_with(other_user) ||
                   Conversation.create_direct!(current_user, other_user)
    redirect_to direct_conversation_url(conversation)
  rescue ActiveRecord::Rollback
    redirect_back_or_to root_url, alert: 'Something went wrong. Please try again later.'
  end

  def edit; end

  def update
    if @conversation.update(direct_conversation_params)
      redirect_to direct_conversation_url(@conversation)
    else
      render :edit
    end
  end

  private

  def direct_conversation_params
    params.require(:conversation).permit(:name)
  end

  def set_direct_conversation
    @conversation = current_user.conversations.find(params[:id])
  end
end
