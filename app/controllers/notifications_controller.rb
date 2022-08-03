class NotificationsController < ApplicationController
  after_action :mark_notifications_as_read

  def index
    @unread_notifications = current_user.notifications.includes(:recipient).unread_notifications_except_message
    @notifications = current_user.notifications.includes(:recipient).all_except_message_notifications
  end

  private

  def mark_notifications_as_read
    current_user.notifications.all_except_message_notifications.mark_as_read!
  end
end
