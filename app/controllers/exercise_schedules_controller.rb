class ExerciseSchedulesController < ApplicationController
  before_action :authorize_user

  def index
    schedules = GoogleCalendar::EventsFetcher.call(current_user) if current_user.permit_calendar?
    render json: schedules
  end

  def new
    @exercises = current_user.all_exercises_to_add
  end

  def create
    GoogleCalendar::EventCreator.call(current_user, exercise_schedule_params)
    redirect_to root_url, notice: 'Successfully created an event.'
  end

  def preview
    @date = params[:date]
    @events = JSON.parse(params[:events])
    render partial: 'exercise_schedules/preview', locals: { date: @date, events: @events }
  end

  private

  def exercise_schedule_params
    params.require(:exercise_schedule).permit(:name, :start, :end)
  end
end
