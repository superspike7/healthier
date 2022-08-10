class DashboardController < ApplicationController
  def index
    @rep_exercises = current_user.repetition_exercises
    @timed_exercises = current_user.timed_exercises
    @routines = current_user.routines.include_associations
  end
end
