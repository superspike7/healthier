class CreateDailyIntakeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_intake_foods do |t|
      t.belongs_to :food
      t.belongs_to :daily_intake

      t.timestamps
    end
  end
end
