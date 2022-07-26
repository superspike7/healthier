class MealsController < ApplicationController
  before_action :authorize_user
  before_action :set_meal, only: %i[edit update destroy]

  def index
    @meals = current_user.meals.includes(:foods)
    render partial: 'meals/table'
  end

  def new
    @new_meal = current_user.meals.build(name: params[:name])
    @foods = current_user.foods
  end

  def create
    @new_meal = current_user.meals.build(meal_params)

    respond_to do |format|
      if @new_meal.save
        @new_meal.add_food(meal_with_food_params)
        format.turbo_stream { flash.now[:notice] = "#{@new_meal.name} has been successfully added."}
        format.html { redirect_to dashboard_path, notice: "#{@new_meal.name} has been successfully added." } 
      else
        render :new
      end
    end

  end

  def edit
    @foods = current_user.foods
  end

  def update
    if @meal.update(meal_params)
      @meal.update_food(meal_with_food_params)
      redirect_to dashboard_path, notice: "#{@meal.name} has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  private

  def set_meal
    @meal = current_user.meals.find(params[:id])
  end

  def meal_with_food_params
    params.require(:meal).permit(:name, :description, food_ids: []).tap { |param| param[:food_ids].reject!(&:blank?) }
  end

  def meal_params
    { name: meal_with_food_params[:name], description: meal_with_food_params[:description] }
  end
end
