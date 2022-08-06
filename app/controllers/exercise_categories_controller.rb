class ExerciseCategoriesController < ApplicationController
  before_action :set_exercise_category
  def index
    @exercise_categories = current_user.exercise_categories
  end

  def show
  end

  def new
    @exercise_category = current_user.exercise_categories.build
  end

  def create
    @exercise_category = current_user.exercise_categories.build(exercise_category_params)
    unless @exercise_category.save
      flash[:notice] = @exercise_category.errors.full_messages.to_sentence
    end

    redirect_to exercise_categories_path
  end

  def edit
  end

  private

  def set_exercise_category
    @exercise_category = current_user.timed_exercises.find_by(id: params[:id])
  end

  def exercise_category_params
    params.require(:exercise_category).permit(:name, :description)
  end
end
