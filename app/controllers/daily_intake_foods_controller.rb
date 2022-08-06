class DailyIntakeFoodsController < ApplicationController
  def new
    if current_user.meals.count.zero?
      flash[:notice] = 'Please add a food first before adding a food in daily intake.'
      redirect_to new_food_url
    else
      @foods = current_user.foods
      @new_food_in_daily_intake = current_user.daily_intakes.last.foods.build
    end
  end

  def create
    food = current_user.foods.find(daily_intake_food_params[:id])
    current_user.daily_intakes.last.add_food(food)
    redirect_back_or_to root_url, notice: "Successfully added #{food.name} in your daily intake."
  end

  def destroy
    food = current_user.foods.find(params[:id])
    current_user.daily_intakes.last.daily_intake_foods.remove_food(food)
    redirect_back_or_to root_url, notice: "Successfully deleted #{food.name} in your daily intake."
  end

  private

  def daily_intake_food_params
    params.require(:food).permit(:id)
  end
end
