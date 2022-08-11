class RoutineExercisesController < ApplicationController
  before_action :authorize_user

  def index
    @routines = current_user.routines.include_associations
    render partial: 'routine_exercises/exercises', locals: { routines: @routines }
  end
end
