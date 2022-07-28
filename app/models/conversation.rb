class Conversation < ApplicationRecord
  has_many :members

  def self.create_direct!(user, another_user)
    ActiveRecord::Base.transaction do
      created_conversation = create!
      created_conversation.members.create!([{ user: }, { user: another_user }])
      created_conversation
    end
  end
end
