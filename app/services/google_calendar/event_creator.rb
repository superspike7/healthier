
module GoogleCalendar
  class EventCreator < ApplicationService
    def initialize(user, start, deadline, event_name)
      @user = user
      @start = start # Time.current.to_datetime.rfc3339
      @deadline = deadline #1.day.from_now.to_datetime.rfc3339
      @event_name = event_name
    end

    def call
      create_event
    end

    private

    def create_event
      calendar_client = Clients::GoogleCalendar.call(@user)
      healthier_calendar_id = GoogleCalendar::CalendarIdFetcher.call(calendar_client, @user)
      calendar_client.google_calendar_service.insert_event(healthier_calendar_id, calendar_event)
    rescue Google::Apis::AuthorizationError
      response = calendar_client.oauth2_client.refresh!
      @user.update_access_token(response)
      retry
    end

    def calendar_event
      Google::Apis::CalendarV3::Event.new(
        summary: @event_name,
        start: Google::Apis::CalendarV3::EventDateTime.new(date_time: @start, time_zone: 'Asia/Manila'),
        end: Google::Apis::CalendarV3::EventDateTime.new(date_time: @deadline, time_zone: 'Asia/Manila')
      )
    end
  end
end
