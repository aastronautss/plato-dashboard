# frozen_string_literal: true

class RescueTimeSyncJob < ApplicationJob
  queue_as :scrobble_sync

  def perform
    RescueTimeService.all.each { |service| RescueTimeFetchJob.perform_later(service) }
  end
end
