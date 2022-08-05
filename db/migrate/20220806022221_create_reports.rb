class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: true, foreign_key: true
      t.references :reported, null: true
      t.string :reason
      t.string :report_type

      t.timestamps
    end
    add_foreign_key :reports, :users, column: :reported_id
  end
end
