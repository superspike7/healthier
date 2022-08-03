class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.includes(:recipient).all_except_message_notifications
    current_user.notifications.all_except_message_notifications.mark_as_read!
  end
end
