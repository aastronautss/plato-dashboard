# frozen_string_literal: true

class MusicScrobbleSyncJob < ApplicationJob
  queue_as :scrobble_sync

  def perform
    services = MusicScrobbleService.all
    services.each { |service| MusicScrobbleServiceSyncJob.perform_later(service) }
  end
end
