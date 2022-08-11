class DashboardController < ApplicationController
  def index
    @rep_exercises = current_user.repetition_exercises
    @timed_exercises = current_user.timed_exercises
    @routines = current_user.routines.include_associations
    @daily_intake_today = current_user.daily_intakes.last
    @nutrients_description = Intake::NutrientsDescriptor.call(@daily_intake_today)
  end
end
