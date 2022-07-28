class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit -> { broadcast_append_later_to 'messages', partial: 'conversation_messages/message' }
end
