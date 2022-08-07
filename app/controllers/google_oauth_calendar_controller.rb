class GoogleOauthCalendarController < ApplicationController
  def create
    current_user.permit_google_calendar(request.env['omniauth.auth'])
    GoogleCalendar::CalendarCreator.call(current_user)
    redirect_to exercise_schedules_url, notice: 'Successfully integrated your Google Calendar.'
  end

  def failure
    flash[:alert] = 'Something went wrong. Try again later.'
    redirect_back_or_to root_url
  end
end
