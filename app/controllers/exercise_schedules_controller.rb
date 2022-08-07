class ExerciseSchedulesController < ApplicationController
  def index
    @user = current_user
  end

  def show; end

  def new
    # list exercise categories here
  end

  def create
    # API call
    # GoogleCalendar::EventCreator.call
  end

  private

  def exercise_schedule_params
    params.require(:exercise_schedule).permit(:exercise_category, :start, :end)
  end
end
