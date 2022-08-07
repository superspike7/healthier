module Clients
  class GoogleCalendar < ApplicationService
    def initialize(user)
      @user = user
    end

    def call
      authorize_google_calendar_service
    end

    private

    def authorize_google_calendar_service
      oauth2_client = Signet::OAuth2::Client.new(client_options)
      google_calendar_service = Google::Apis::CalendarV3::CalendarService.new
      google_calendar_service.authorization = oauth2_client
      Struct.new(:oauth2_client, :google_calendar_service).new(
        oauth2_client,
        google_calendar_service
      )
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
