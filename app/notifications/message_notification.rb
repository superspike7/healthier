# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database

  # Add required params
  param :message

  # Define helper methods to make rendering easier.
  # def message
  #   params[:message].content
  # end

  # def url
  #   conversation_path(params[:message].conversation)
  # end
end
