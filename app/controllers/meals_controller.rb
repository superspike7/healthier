class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    @meals = current_user.meals.includes(:foods)
    render partial: 'meals/table', locals: { meals: @meals }
  end

  def show; end

  def new
    @new_meal = current_user.meals.build
  end

  def create
    @new_meal = current_user.meals.build(meal_params)
    if @new_meal.save
      redirect_to meals_path, notice: "#{@new_meal.name} has been successfully added."
    else
      render :new
    end
  end

  def edit
    @foods = current_user.foods
  end

  def update
    if @meal.update(meal_params)
      redirect_to root_path, notice: "#{@meal.name} has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: "#{@meal.name} has been successfully deleted."
  end

  private

  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :description, food_ids: [])
  end
end
