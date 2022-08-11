class FoodsController < ApplicationController
  before_action :authorize_user
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = current_user.foods
    render partial: 'foods/table'
  end

  def new
    @new_food = current_user.foods.build(name: params[:name])
  end

  def create
    @new_food = current_user.foods.build(food_params)
    respond_to do |format|
      if @new_food.save
        format.turbo_stream { flash.now[:notice] = "#{@new_food.name} has been successfully added." }
        format.html { redirect_to root_path, notice: "#{@new_food.name} has been successfully added." } 
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to root_path, notice: "#{@food.name} has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path
  end

  private

  def set_food
    @food = current_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :description, :calories, :carbohydrates, :fats, :protein)
  end
end
