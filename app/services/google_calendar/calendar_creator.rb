
module GoogleCalendar
  class CalendarCreator < ApplicationService
    CALENDAR_NAME = 'Healthier'.freeze

    def initialize(user)
      @user = user
    end

    def call
      create_calendar
    end

    private

    def create_calendar
      calendar_client = Clients::GoogleCalendar.call(@user)
      calendar_client.google_calendar_service.insert_calendar(calendar)
    rescue Google::Apis::AuthorizationError
      response = calendar_client.oauth2_client.refresh!
      @user.update_access_token(response)
      retry
    end

    def calendar
      Google::Apis::CalendarV3::Calendar.new(summary: CALENDAR_NAME, time_zone: 'Asia/Manila')
    end
  end
end
