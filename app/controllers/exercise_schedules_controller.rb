class ExerciseSchedulesController < ApplicationController
  def index
    @schedules = GoogleCalendar::EventsFetcher.call(current_user) if current_user.permit_calendar?
  end

  def new
    @categories = current_user.categories
  end

  def create
    GoogleCalendar::EventCreator.call(current_user, exercise_schedule_params)
    redirect_to root_url, alert: 'Successfully created an event.'
  end

  private

  def exercise_schedule_params
    params.require(:exercise_schedule).permit(:name, :start, :end)
  end
end
