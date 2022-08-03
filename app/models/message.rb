class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  belongs_to :user

  after_create_commit :notify_recipient, :broadcast_to_user

  private

  def notify_recipient
    members = conversation.members.includes(:user)
    members.each do |member|
      next if member.user.eql?(user)

      MessageNotification.with(conversation:).deliver_later(member.user)
    end
  end

  def broadcast_to_user
    broadcast_append_later_to 'messages', partial: 'conversation_messages/message',
                                          target: "messages_#{conversation.id}",
                                          locals: { user: Current.user, message: self }
  end
end
