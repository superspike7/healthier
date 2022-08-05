
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
      authorize_google_client
      calendar = Google::Apis::CalendarV3::Calendar.new(summary: CALENDAR_NAME, time_zone: 'Manila')
      google_calendar_service.insert_calendar(calendar)
    rescue Google::Apis::AuthorizationError
      response = oauth2_client.refresh!
      @user.update_access_token(response)
      retry
    end

    def authorize_google_client
      @oauth2_client = Signet::OAuth2::Client.new(client_options)
      @google_calendar_service = Google::Apis::CalendarV3::CalendarService.new
      @google_calendar_service.authorization = @oauth2_client
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
