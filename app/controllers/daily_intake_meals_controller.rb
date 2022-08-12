class DailyIntakeMealsController < ApplicationController
  before_action :authorize_user

  def new
    @meals = current_user.meals
  end

  def create
    meals = current_user.meals.find(daily_intake_meal_params[:meals])
    current_user.daily_intakes.last.add_foods_from_meals(meals)
    redirect_to dashboard_url
  end

  private

  def daily_intake_meal_params
    params.require(:daily_intake).permit(meals: []).tap { |param| param[:meals].reject!(&:blank?) }
  end
end
