# To deliver this notification:
#
# MessageNotification.with(post: @post).deliver_later(current_user)
# MessageNotification.with(post: @post).deliver(current_user)

class MessageNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database

  # Add required params
  param :conversation

  # Define helper methods to make rendering easier.
  def conversation
    params[:conversation]
  end

  # def url
  #   conversation_path(params[:message].conversation)
  # end
end
