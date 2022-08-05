
module GoogleCalendar
  class EventCreator < ApplicationService
    CALENDAR_NAME = 'Healthier'.freeze

    def initialize(user)
      @user = user
    end

    def call
      create_event
    end

    private

    def create_event
      authorize_google_client
      calendar = calendar_id


    rescue Google::Apis::AuthorizationError
      response = client.refresh!
      # assign new access token to the user

      retry
    end

    def client_options
      {
        access_token: User.first.access_token,
        refresh_token: User.first.refresh_token,
        client_id: Figaro.env.google_client_id,
        client_secret: Figaro.env.google_client_secret
      }
    end

    def authorize_google_client
      oauth2_client = Signet::OAuth2::Client.new(client_options)
      @google_calendar_service = Google::Apis::CalendarV3::CalendarService.new
      @google_calendar_service.authorization = oauth2_client
    end

    def calendar_id
      result = @google_calendar_service.list_calendar_lists
      # get calendar id
      result.items.each do |e|
        return e.summary if e.summary == CALENDAR_NAME
      end
    end
  end
end
