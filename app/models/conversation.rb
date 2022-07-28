class Conversation < ApplicationRecord
  has_many :members

  def self.create_direct!(user, another_user)
    users = user == another_user ? { user: } : [{ user: }, { user: another_user }]
    ActiveRecord::Base.transaction do
      created_conversation = create!
      created_conversation.members.create!(users)
      created_conversation
    end
  end
end
