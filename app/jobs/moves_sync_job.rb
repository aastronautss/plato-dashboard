# frozen_string_literal: true

class MovesSyncJob < ApplicationJob
  queue_as :scrobble_sync

  def perform
    MovesService.all.each { |service| MovesFetchJob.perform_later(service) }
  end
end
