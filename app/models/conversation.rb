class Conversation < ApplicationRecord
  has_many :members
  has_many :messages

  validates :name, length: { maximum: 48 }

  scope :show_messages, -> { messages.includes(:user) }

  def self.create_direct!(user, another_user)
    users = user == another_user ? { user: } : [{ user: }, { user: another_user }]
    ActiveRecord::Base.transaction do
      created_conversation = create!
      created_conversation.members.create!(users)
      created_conversation
    end
  end

  def show_conversation_name(user)
    return members.first_username if members_count == 1

    name || members.other_username(user)
  end
end
