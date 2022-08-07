class CategoryTimedExercisesController < ApplicationController
  def destroy
    category = current_user.categories.find(params[:category_id])
    exercise = current_user.timed_exercises.find(params[:id])
    category.remove_timed_exercise(exercise)
    redirect_back_or_to root_url, notice: "Successfully deleted a timed exercise in #{category.name} category."
  end
end
