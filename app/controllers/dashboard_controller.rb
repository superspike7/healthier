class DashboardController < ApplicationController
  before_action :authorize_user

  def show
    @timed_exercises = current_user.timed_exercises
    @daily_intake_today = current_user.daily_intakes.last
    @nutrients_description = Intake::NutrientsDescriptor.call(@daily_intake_today)
  end
end
