
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
      Time.new(@event_params['start(1i)'], @event_params['start(2i)'], @event_params['start(3i)'],
               @event_params['start(4i)'], @event_params['start(5i)']).to_datetime.rfc3339
    end

    def end_time
      Time.new(@event_params['end(1i)'], @event_params['end(2i)'], @event_params['end(3i)'],
               @event_params['end(4i)'], @event_params['end(5i)']).to_datetime.rfc3339
    end
  end
end
