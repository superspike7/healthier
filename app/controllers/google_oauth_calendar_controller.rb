class GoogleOauthCalendarController < ApplicationController
  before_action :authorize_user
  
  def create
    current_user.permit_google_calendar(request.env['omniauth.auth'])
    GoogleCalendar::CalendarCreator.call(current_user)
    redirect_to dashboard_url, notice: 'Successfully integrated your Google Calendar.'
  end

  def failure
    flash[:alert] = 'Something went wrong. Try again later.'
    redirect_back_or_to dashboard_url
  end
end
