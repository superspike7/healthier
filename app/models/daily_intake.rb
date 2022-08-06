class DailyIntake < ApplicationRecord
  belongs_to :user
  has_many :daily_intake_foods
  has_many :foods, through: :daily_intake_foods

  def total_calories
    foods.sum(:calories)
  end

  def total_carbohydrates
    foods.sum(:carbohydrates)
  end

  def total_fats
    foods.sum(:fats)
  end

  def total_protein
    foods.sum(:protein)
  end

  def add_food(food)
    foods << food
  end

  def add_food_from_meal(meal)
    foods << meal.foods
  end
end
