class Meal < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods, -> { distinct }

  validates :name, presence: true
  validates :description, length: { maximum: 24 }

  def total_macronutrients
  end

  def add_food(food)
    foods << food
  end

  def remove_food(food)
    foods.destroy(food)
  end
end
