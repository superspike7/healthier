class Meal < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods, -> { distinct }

  validates :name, presence: true
  validates :description, length: { maximum: 24 }

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
    foods << Food.find(food[:food_ids])
  end

  def update_food(food)
    foods.replace(Food.find(food[:food_ids]))
  end

  def remove_food(food)
    foods.destroy(food)
  end
end
