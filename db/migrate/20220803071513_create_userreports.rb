class CreateUserreports < ActiveRecord::Migration[7.0]
  def change
    create_table :userreports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reported, null: false
      t.text :reason

      t.timestamps
    end
    add_foreign_key :userreports, :users, column: :reported_id
  end
end
