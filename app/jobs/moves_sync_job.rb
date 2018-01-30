# frozen_string_literal: true

##
# Job to sync all Moves location scrobbles with local database.
#
class MovesSyncJob < ApplicationJob
  queue_as :scrobble_sync

  def perform
    MovesService.all.each { |service| MovesFetchJob.perform_later(service) }
  end
end
