class NotificationsController < ApplicationController
  def index
    # show all notifications
    @notifications = current_user.notifications.all_except_message_notifications
  end
end
