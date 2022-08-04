class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :followed, null: false

      t.timestamps
    end
    add_foreign_key :relationships, :users, column: :followed_id
    add_index :relationships, [:user_id, :followed_id], unique: true
  end
end
