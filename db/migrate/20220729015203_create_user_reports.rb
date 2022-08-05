class CreateUserReports < ActiveRecord::Migration[7.0]
  def change
    create_table :user_reports do |t|
      t.references :reporter, null: false
      t.references :reported, null: false
      t.text :reason

      t.timestamps
    end
    add_foreign_key :user_reports, :users, column: :reporter_id
    add_foreign_key :user_reports, :users, column: :reported_id
  end
end
