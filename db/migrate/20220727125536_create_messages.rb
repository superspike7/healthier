class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: true
      t.integer :receiver_id

      t.string :content

      t.timestamps
    end

    add_index :messages, :receiver_id
  end
end
