class AddMembersCountToConversations < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :members_count, :integer
  end
end
