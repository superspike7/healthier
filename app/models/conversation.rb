class Conversation < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'

  scope :recent, -> { order(updated_at: :desc) }

  after_create_commit do
    broadcast_prepend_later_to 'conversations', partial: 'direct_conversations/conversation',
                                                target: "conversation_#{conversation_current_member_user_id}",
                                                locals: { conversation: self, user: Current.user }
  end

  after_update_commit do
    broadcast_update_later_to 'conversations', partial: 'direct_conversations/conversation',
                                               target: "conversation_#{conversation_current_member_user_id}",
                                               locals: { conversation: self, user: Current.user }
    broadcast_update_later_to 'unread_message_notifications', partial: 'direct_conversations/notification',
                                                              target: "unread_message_#{other_member_user_id}",
                                                              locals: { user: other_member }
  end

  after_destroy_commit do
    broadcast_remove_to 'conversations', target: "conversation_#{conversation_current_member_user_id}"
  end

  def self.create_direct!(current_user, other_user)
    users = current_user == other_user ? { user: current_user } : [{ user: current_user }, { user: other_user }]
    ActiveRecord::Base.transaction do
      created_conversation = create!
      created_conversation.members.create!(users)
      if users.count == 2
        ConversationNotification.with(conversation: created_conversation, user: current_user).deliver_later(other_user)
      end
      created_conversation
    end
  end

  def show_conversation_name(user)
    return members.first_member.username if members_count == 1

    user == Current.user ? members.other_username(user) : members.current_user_username(user)
  end

  def mark_as_read(user)
    notifications_as_conversation.where(recipient: user).mark_as_read!
  end

  def unread_notifications_count(user)
    unread_messages = notifications_as_conversation.unread
    unread_count = if user == Current.user
                     unread_messages.where(recipient: user).count
                   else
                     unread_messages.where.not(recipient: user).count
                   end
    unread_count.zero? ? nil : unread_count
  end

  # below are methods for turbostream target uniqueness

  def conversation_other_member_user_id
    user_id = members_count == 1 ? members.current_user(Current.user).id : members.other_user(Current.user).id
    "#{id}#{user_id}"
  end

  def conversation_current_member_user_id
    return if Current.user.nil?

    user_id = members.current_user(Current.user).id
    "#{id}#{user_id}"
  end

  def other_member_user_id
    members_count == 1 ? nil : members.other_user(Current.user).id
  end

  def other_member
    members_count == 1 ? nil : members.other_user(Current.user)
  end
end
