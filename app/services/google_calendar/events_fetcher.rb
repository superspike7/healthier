
module GoogleCalendar
  class EventsFetcher < ApplicationService
    CALENDAR_NAME = 'Healthier'.freeze

    def initialize(user)
      @user = user
    end

    def call
      request_events
    end

    private

    def request_events
      authorize_google_client
      calendar_id = find_healthier_calendar_id
      @google_calendar_service.list_events(calendar_id)
    rescue Google::Apis::AuthorizationError
      response = @oauth2_client.refresh!
      @user.update_access_token(response)
      retry
    end

    def client_options
      {
        access_token: @user.access_token,
        refresh_token: @user.refresh_token,
        client_id: Figaro.env.google_client_id,
        client_secret: Figaro.env.google_client_secret,
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token'
      }
    end

    def authorize_google_client
      @oauth2_client = Signet::OAuth2::Client.new(client_options)
      @google_calendar_service = Google::Apis::CalendarV3::CalendarService.new
      @google_calendar_service.authorization = @oauth2_client
    end

    def find_healthier_calendar_id
      result = @google_calendar_service.list_calendar_lists
      result.items.each do |e|
        break e.id if e.summary == CALENDAR_NAME
      end
    end
  end
end
