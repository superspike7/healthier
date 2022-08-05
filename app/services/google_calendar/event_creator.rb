
module GoogleCalendar
  class EventCreator < ApplicationService
    CALENDAR_NAME = 'Healthier'.freeze

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
      authorize_google_client
      calendar_id = find_healthier_calendar_id
      event = Google::Apis::CalendarV3::Event.new(
        summary: @event_name,
        start: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: @start,
          time_zone: 'Manila'
        ),
        end: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: @deadline,
          time_zone: 'Manila'
      ))
      @google_calendar_service.insert_event(calendar_id, event)
    end

    def client_options
      {
        access_token: User.first.access_token,
        refresh_token: User.first.refresh_token,
        client_id: Figaro.env.google_client_id,
        client_secret: Figaro.env.google_client_secret,
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
      }
    end

    def authorize_google_client
      oauth2_client = Signet::OAuth2::Client.new(client_options)
      @google_calendar_service = Google::Apis::CalendarV3::CalendarService.new
      @google_calendar_service.authorization = oauth2_client
    end

    def find_healthier_calendar_id
      result = @google_calendar_service.list_calendar_lists
      result.items.each do |e|
        break e.id if e.summary == CALENDAR_NAME
      end
    end
  end
end
