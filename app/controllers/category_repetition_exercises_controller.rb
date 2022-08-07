class CategoryRepetitionExercisesController < ApplicationController
  def destroy
    category = current_user.categories.find(params[:category_id])
    exercise = current_user.repetition_exercises.find(params[:id])
    category.remove_repetition_exercise(exercise)
    redirect_back_or_to root_url, notice: "Successfully deleted a repetition exercise in #{category.name} category."
  end
end
