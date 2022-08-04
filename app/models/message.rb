class Message < ApplicationRecord
  belongs_to :conversation, touch: true
  belongs_to :user
  belongs_to :receiver, class_name: 'User'

  validates :receiver_id, presence: true

  after_create_commit :broadcast_to_user

  def send_message_with_notification
    members = conversation.members.includes(:user)
    return send_to_self if conversation.members_count == 1

    members.each do |member|
      next if member.user.eql?(user)

      send_to_receiver_with_notification(member)
    end
  end

  private

  def send_to_self
    self.receiver_id = user.id
    save
  end

  def send_to_receiver_with_notification(member)
    self.receiver_id = member.user.id
    save
    MessageNotification.with(conversation:).deliver_later(member.user)
  end

  def broadcast_to_user
    broadcast_append_later_to 'messages', partial: 'conversation_messages/message',
                                          target: "messages_#{conversation.id}",
                                          locals: { user: receiver, message: self, owned_by: user.id }
  end
end
