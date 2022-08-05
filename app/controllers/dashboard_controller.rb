class DashboardController < ApplicationController
  def index
    @rep_exercises = current_user.rep_exercises
  end
end
