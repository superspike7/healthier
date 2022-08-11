
module GoogleCalendar
  class EventsFetcher < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      fetch_events
    end

    private

    def fetch_events
      calendar_client = Clients::GoogleCalendar.call(@user)
      healthier_calendar_id = GoogleCalendar::CalendarIdFetcher.call(calendar_client, @user)
      response = calendar_client.google_calendar_service.list_events(healthier_calendar_id)
      # response.items.map { |e| Struct.new(:name, :start, :end).new(e.summary, e.start, e.end) }
      response.items.map { |e| { name: e.summary, start: e.start, end: e.end } }
    rescue Google::Apis::AuthorizationError
      response = calendar_client.oauth2_client.refresh!
      @user.update_access_token(response)
      retry
    end
  end
end
