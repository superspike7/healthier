class CategoryExercisesController < ApplicationController
  before_action :set_category

  def new
    @timed_exercises = current_user.timed_exercises.all_except(@category.timed_exercises)
    @rep_exercises = current_user.repetition_exercises.all_except(@category.repetition_exercises)
  end

  def create
    @category.add_exercise_in_category(exercise_params)
    redirect_to categories_url, notice: "Successfully added exercise in #{@category.name}"
  end

  private

  def exercise_params
    params.require(:category_exercise).permit(repetition: [], timed: []).tap do |param|
      param.each_value { |value| value.reject!(&:blank?) }
    end
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end
end
