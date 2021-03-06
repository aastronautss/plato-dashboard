# frozen_string_literal: true

class ProcessMusicScrobblesJob < ApplicationJob
  queue_as :scrobble_process

  def perform(service, scrobble_data)
    service.adapter.import_scrobbles scrobble_data
  end
end
