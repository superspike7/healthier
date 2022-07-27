class ConversationsController < ApplicationController
  def show
    #show the specific conversation

    @conversation = current_user.conversations
  end

  def create
    # link to access the conversation.

    # Scenario 1: Creating a new conversation
      # The user clicks another user to chat him/her.
      # If conversation does not exist yet,
      # we create a new conversation then in after_create callback we add the members of 
      # current_user id and the id that you clicked. Conversation.members.build(id ni current_user and id nung other user)
      # then redirect to the show conversation page


    # if a conversation is present between them, choose that.
    # if not, create one.
  end
end
