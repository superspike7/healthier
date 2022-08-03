class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  scope :unread_notifications_except_message, -> { all_except_message_notifications.unread }
  scope :unread_messages, -> { where(type: MessageNotification.name).unread }
  scope :all_except_message_notifications, -> { where.not(type: MessageNotification.name) }

  # after_create_commit -> { broadcast_append_later_to 'notifications', partial: 'direct_conversations/notification', locals: { notifications: self.class } }

  # def broadcast_notification
  #   broadcast_action_later_to 'notification_count', 
  # end
end
