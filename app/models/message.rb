class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  has_noticed_notifications

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
    broadcast_append_later_to 'messages', partial: 'conversation_messages/message'
  end
end
