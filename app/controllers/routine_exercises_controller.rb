class RoutineExercisesController < ApplicationController
  before_action :set_routine, except: :index

  def index
    render partial: 'routine_exercises/exercises'
  end

  def new
    @timed_exercises = current_user.timed_exercises.all_except(@routine.timed_exercises)
    @rep_exercises = current_user.repetition_exercises.all_except(@routine.repetition_exercises)
  end

  def create
    @routine.add_exercise_in_routine(exercise_params)
    redirect_to routines_url, notice: "Successfully added exercise in #{@routine.name}"
  end

  private

  def exercise_params
    params.require(:routine_exercise).permit(repetition: [], timed: []).tap do |param|
      param.each_value { |value| value.reject!(&:blank?) }
    end
  end

  def set_routine
    @routine = current_user.routines.find(params[:routine_id])
  end
end
