# frozen_string_literal: true

module RescueTime
  class Scrobble
    UNCATEGORIZED_CATEGORY = 'Uncategorized'
    SCROBBLE_TYPE = 'Computer'

    class << self
      def from_api(service, api_props = [])
        data = api_props.each_with_object({}) do |activity, times|
          time = Time.parse activity[:date]
          times[time] ||= []

          times[time] << {
            activity: activity[:activity],
            category: activity[:category] || UNCATEGORIZED_CATEGORY,
            type: SCROBBLE_TYPE,

            time_spent: activity[:time_spent_seconds],
            score: activity[:productivity]
          }
        end

        data.map do |time, activities|
          params = {
            external_service_id: service.id,
            scrobbled_at: time,

            data: activities
          }

          ActivityScrobble.new params
        end
      end
    end
  end
end
