class FoodsMealsController < ApplicationController
  before_action :find_meal

  def new
    @new_food_meal = @meal.foods.build
    @foods = current_user.foods.all_except(@meal.foods)
  end

  def create
    foods = current_user.foods.find(food_meal_params[:id])
    @meal.add_food(foods)
    redirect_back_or_to root_url, notice: "Successfully added foods in #{@meal.name} meal."
  end

  def destroy
    food = current_user.foods.find(params[:id])
    @meal.remove_food(food)
    redirect_back_or_to root_url, notice: "Successfully deleted foods in #{@meal.name} meal."
  end

  private

  def find_meal
    @meal = current_user.meals.find(params[:meal_id])
  end

  def food_meal_params
    params.require(:food_meal).permit(id: []).tap { |param| param[:id].reject!(&:blank?) }
  end
end
