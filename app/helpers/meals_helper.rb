module MealsHelper
  def render_food_names_from_meal(meal)
    meal.foods.map(&:name).join(', ')
  end
end