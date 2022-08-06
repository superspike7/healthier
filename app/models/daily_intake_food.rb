class DailyIntakeFood < ApplicationRecord
  belongs_to :food
  belongs_to :daily_intake

  def remove_food(food)
    food_to_remove = where(food_id: food.id).last
    food_to_remove.delete
  end
end
