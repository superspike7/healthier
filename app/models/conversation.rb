class Conversation < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_noticed_notifications model_name: 'Notification'

  validates :name, length: { maximum: 48 }


  after_update_commit -> { broadcast_replace_to 'name', partial: 'direct_conversations/name' }

  scope :recent, -> { order(updated_at: :desc) }

  after_create_commit do
    broadcast_prepend_later_to 'conversations', partial: 'direct_conversations/conversation', 
                                                locals: { conversation: self, user: Current.user }
  end

  after_update_commit do
    broadcast_update_later_to 'conversations', partial: 'direct_conversations/conversation',
                                               locals: { conversation: self,
                                                         target: "conversations_#{Current.user.id}",
                                                         user: Current.user }
    broadcast_update_later_to 'unread_message_notifications', partial: 'direct_conversations/notification',
                                                              target: "unread_count_#{Current.user.id}",
                                                              locals: { user: Current.user }
  end

  after_destroy_commit do
    broadcast_remove_to 'conversations'
  end

  def self.create_direct!(user, another_user)
    users = user == another_user ? { user: } : [{ user: }, { user: another_user }]
    ActiveRecord::Base.transaction do
      created_conversation = create!
      created_conversation.members.create!(users)
      created_conversation
    end
  end

  def show_conversation_name(user)
    members_count == 1 ? members.first_username : members.other_username(user)
  end

  def mark_as_read(user)
    notifications_as_conversation.where(recipient: user).mark_as_read!
  end

  def unread_notifications_count(user)
    unread_messages = notifications_as_conversation.unread
    if user == Current.user
      unread_messages.where(recipient: user).count
    else
      unread_messages.where.not(recipient: user).count
    end
  end

  def member?(current_user)
    members.where(user: current_user).present?
  end
end
