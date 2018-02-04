# frozen_string_literal: true

class LastFmSyncJob < ApplicationJob
  queue_as :scrobble_sync

  def perform
    services = LastFmService.all
    services.each { |service| LastFmFetchJob.perform_later(service) }
  end
end
