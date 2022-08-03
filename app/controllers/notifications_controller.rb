class NotificationsController < ApplicationController
  def index
    # show all notifications
    @notifications = current_user.notifications.includes(:recipient).all_except_message_notifications
  end
end
