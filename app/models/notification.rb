class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  # after_create_commit -> { broadcast_append_later_to 'notifications', partial: 'direct_conversations/notification', locals: { notifications: self.class } }

  # def broadcast_notification
  #   broadcast_action_later_to 'notification_count', 
  # end
end
