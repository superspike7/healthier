class MessageNotification < Noticed::Base
  deliver_by :database

  param :conversation

  def conversation
    params[:conversation]
  end
end
