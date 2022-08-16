class DailyIntake < ApplicationRecord
  belongs_to :user
  has_many :daily_intake_foods, dependent: :destroy
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

  def add_foods(food)
    foods << Food.find(food[:foods])
  end

  def add_foods_from_meals(meals)
    meals.each { |meal| foods << meal.foods }
  end
end
