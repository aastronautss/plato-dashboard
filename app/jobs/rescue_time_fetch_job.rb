# frozen_string_literal: true

class RescueTimeFetchJob < ApplicationJob
  API_CALL_INTERVAL = 0.3
  EARLIEST_DATE = Date.parse '2010-01-01'

  queue_as :scrobble_fetch

  def perform(service)
    adapter = service.adapter

    date = Date.today

    while date >= EARLIEST_DATE
      scrobble_data = adapter.get_scrobbles(from: date, to: date)
      ProcessScrobblesJob.perform_later(service, scrobble_data)

      date -= 1
      sleep API_CALL_INTERVAL
    end
  end
end
