class DailyIntakeFoodsController < ApplicationController
  before_action :authorize_user

  def new
    @foods = current_user.foods
  end

  def create
    current_user.daily_intakes.last.add_foods(daily_intake_food_params)
    redirect_to root_path, notice: 'Successfully added food/s in your daily intake.'
  end

  private

  def daily_intake_food_params
    params.require(:food).permit(foods: []).tap { |param| param[:foods].reject!(&:blank?) }
  end
end
