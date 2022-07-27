class ConversationsController < ApplicationController
  def show
    #show the conversation
    
    @conversation = current_user.conversations
  end

  def create
    # link to access the conversation.
    
    # find the desired member id to chat (?)
    # if a conversation is present between them, choose that.
    # if not, create one.
  end
end
