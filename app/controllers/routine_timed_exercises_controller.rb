class RoutineTimedExercisesController < ApplicationController
  def destroy
    routine = current_user.routines.find(params[:routine_id])
    exercise = current_user.timed_exercises.find(params[:id])
    routine.remove_timed_exercise(exercise)
    redirect_back_or_to root_url, notice: "Successfully deleted a timed exercise in #{routine.name} routine."
  end
end
