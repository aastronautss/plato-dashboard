# frozen_string_literal: true

class MusicScrobbleServiceSyncJob < ApplicationJob
  API_CALL_INTERVAL = 0.3

  queue_as :scrobble_fetch
  # rescue_from(StandardError) do
  #   retry_job wait: 10.minutes, queue: :default
  # end

  def perform(service)
    adapter = service.adapter

    scrobble_data = adapter.get_scrobbles

    until scrobble_data.blank?
      ProcessMusicScrobblesJob.perform_later(service, scrobble_data)
      next_page_start = scrobble_data[-1]['date']['uts'].to_i


      sleep API_CALL_INTERVAL
      scrobble_data = adapter.get_scrobbles to: next_page_start
    end
  end
end
