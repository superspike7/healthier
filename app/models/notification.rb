class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  # after_create_commit -> { broadcast_append_later_to 'notifications', partial: 'direct_conversations/conversation' }
end
