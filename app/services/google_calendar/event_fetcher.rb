
module GoogleCalendar
  class EventFetcher < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      get_event
    end

    private

    def get_event
      oauth2_client = Signet::OAuth2::Client.new(client_options)
      google_calendar_service = Google::Apis::CalendarV3::CalendarService.new
      google_calendar_service.authorization = oauth2_client
      # method to fetch events in Healthier calendar
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
  end
end
