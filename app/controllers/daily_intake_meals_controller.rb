class DailyIntakeMealsController < ApplicationController
  def new
    if current_user.meals.count.zero?
      flash[:notice] = 'Please add a meal first before adding a meal in daily intake.'
      redirect_to new_meal_url
    else
      @meals = current_user.meals
      @new_meal_in_daily_intake = current_user.daily_intakes.last.meals.build
    end
  end

  def create
    meal = current_user.foods.find(daily_intake_meal_params[:meal])
    current_user.daily_intakes.last.add_food_from_meal(meal)
    redirect_back_or_to root_url, notice: "Successfully added #{meal.name} in your daily intake."
  end

  private

  def daily_intake_meal_params
    params.require(:daily_intake).permit(:meal)
  end
end
