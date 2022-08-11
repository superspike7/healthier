
module GoogleCalendar
  class EventCreator < ApplicationService
    def initialize(user, event_params)
      @user = user
      @event_params = event_params
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
        summary: @event_params[:name],
        start: Google::Apis::CalendarV3::EventDateTime.new(date_time: start_time, time_zone: 'Asia/Manila'),
        end: Google::Apis::CalendarV3::EventDateTime.new(date_time: end_time, time_zone: 'Asia/Manila')
      )
    end

    def start_time
      @event_params[:start].to_datetime.change(offset: '+0800').rfc3339
    end

    def end_time
      @event_params[:end].to_datetime.change(offset: '+0800').rfc3339
    end
  end
end
