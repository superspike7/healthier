class GroupConversationsController < ApplicationController
  def new
    @group_conversation = current_user.conversations.new
  end

  def index
    @group_conversations = current_user.conversations.joins(:members).group('conversations.id').having('count(conversation_id) > 2')
    # Conversation.joins(:members).group('conversationd.id').having('count(conversation_id) > 2')
  end

  def show

  end

  def create

  end
end
