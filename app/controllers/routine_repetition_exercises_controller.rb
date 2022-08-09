class RoutineRepetitionExercisesController < ApplicationController
  def destroy
    routine = current_user.routines.find(params[:routine_id])
    exercise = current_user.repetition_exercises.find(params[:id])
    routine.remove_repetition_exercise(exercise)
    redirect_back_or_to root_url, notice: "Successfully deleted a repetition exercise in #{routine.name} routine."
  end
end
