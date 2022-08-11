class RoutineExercisesController < ApplicationController
  def index
    @routines = current_user.routines.include_associations
    render partial: 'routine_exercises/exercises', locals: { routines: @routines }
  end
end
