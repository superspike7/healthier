class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = current_user.foods
  end

  def show; end

  def new
    @new_food = current_user.foods.build
  end

  def create
    new_food = current_user.foods.build(food_params)
    if new_food.save
      redirect_to foods_path, notice: "#{@food.name} has been successfully added."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to foods_path, notice: "#{@food.name} has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path, notice: "#{@food.name} has been successfully deleted."
  end

  private

  def set_food
    @food = current_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :description, :calories, :carbohydrates, :fats, :protein)
  end
end
