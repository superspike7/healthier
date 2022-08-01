class Conversation < ApplicationRecord
  has_many :members
  has_many :messages
  has_noticed_notifications model_name: 'Notification'

  validates :name, length: { maximum: 48 }


  after_update_commit -> { broadcast_replace_to 'name', partial: 'direct_conversations/name' }


  after_update_commit -> { broadcast_replace_to 'conversation_name', partial: 'direct_conversations/name' }

  broadcasts_to ->(_conversation) { 'conversations' }, inserts_by: :append, partial: 'direct_conversations/conversation'

  def self.create_direct!(user, another_user)
    users = user == another_user ? { user: } : [{ user: }, { user: another_user }]
    ActiveRecord::Base.transaction do
      created_conversation = create!
      created_conversation.members.create!(users)
      created_conversation
    end
  end

  def show_conversation_name(user)
    return name if name.present?

    members_count == 1 ? members.first_username : members.other_username(user)
  end

  def mark_as_read(user)
    notifications_as_conversation.where(recipient: user).mark_as_read!
  end

  def unread_notifications_count(user)
    notifications_as_conversation.where(recipient_id: user).unread.count
  end
end
