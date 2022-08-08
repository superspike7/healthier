class DashboardController < ApplicationController
  def index
    @rep_exercises = current_user.repetition_exercises
    @timed_exercises = current_user.timed_exercises
  end
end
