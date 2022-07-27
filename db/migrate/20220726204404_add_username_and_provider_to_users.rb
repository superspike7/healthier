class AddUsernameAndProviderToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :provider, :string

    add_index :users, :username
  end
end
