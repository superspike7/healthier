
module GoogleCalendar
  class EventCreator < ApplicationService
    def initialize(dummy)
    end

    def call
      dummy_method
    end

    private

    def dummy_method
      client = Google::Apis::CalendarV3::CalendarService.new
    end
  end
end
