class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit -> { broadcast_append_later_to 'message_notifications', partial: 'direct_conversations/notification' }
end
