class CreateFoodsMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :foods_meals, id: false do |t|
      t.belongs_to :food
      t.belongs_to :meal

      t.timestamps
    end

    add_index :foods_meals, [:food_id, :meal_id], unique: true
  end
end
