class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  scope :unread_notifications_except_message, -> { all_except_message_notifications.unread }
  scope :read_notifications_except_message, -> { all_except_message_notifications.read }
  scope :unread_messages, -> { where(type: MessageNotification.name).unread }
  scope :all_except_message_notifications, -> { where.not(type: MessageNotification.name) }

  after_create_commit do
    broadcast_update_later_to 'notification_count', partial: 'notifications/unread_count',
                                                    target: "unread_count_#{recipient_id}",
                                                    locals: { user: recipient }
  end
end
