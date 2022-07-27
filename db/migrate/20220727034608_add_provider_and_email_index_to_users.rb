class AddProviderAndEmailIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, %i[provider email]
  end
end
