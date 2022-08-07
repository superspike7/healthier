
module GoogleCalendar
  class CalendarIdFetcher < ApplicationService
    CALENDAR_NAME = 'Healthier'.freeze

    def initialize(calendar_client, user)
      @calendar_client = calendar_client
      @user = user
    end

    def call
      fetch_healthier_calendar_id
    end

    private

    def fetch_healthier_calendar_id
      result = @calendar_client.google_calendar_service.list_calendar_lists
      result.items.select { |e| e.summary == CALENDAR_NAME }.first.id
    end
  end
end
