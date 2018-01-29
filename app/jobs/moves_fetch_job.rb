# frozen_string_literal: true

class MovesFetchJob < ApplicationJob
  API_CALL_INTERVAL = 2.5
  EARLIEST_DATE = Date.parse '2017-01-01'

  queue_as :scrobble_fetch

  def perform(service)
    adapter = service.adapter

    to_date = Date.today
    from_date = to_date - 6

    scrobble_data = adapter.get_scrobbles(from: from_date, to: to_date)

    until to_date < EARLIEST_DATE
      ProcessScrobblesJob.perform_later(service, scrobble_data) unless scrobble_data.nil?

      to_date = from_date - 1
      from_date = to_date - 6

      sleep API_CALL_INTERVAL

      scrobble_data = adapter.get_scrobbles(from: from_date, to: to_date)
    end
  end
end
