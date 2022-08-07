class DashboardController < ApplicationController
  def index
    @rep_exercises = current_user.repetition_exercises
  end
end
