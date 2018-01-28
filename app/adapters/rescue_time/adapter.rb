# frozen_string_literal: true

require 'rescuetime'

module RescueTime
  ##
  # Wrapper for the +rescuetime+ gem.
  #
  class Adapter
    def initialize(service)
      @service = service
    end

    def get_scrobbles(to: Date.today, from: Date.today)
      client.activities.format(:array).order_by(:time, interval: :minute).from(from).to(to).all
    end

    def import_scrobbles(scrobble_data)
      scrobbles = RescueTime::Scrobble.from_api(service, scrobble_data)
      ActivityScrobble.import scrobbles,
        on_duplicate_key_update: { constraint_name: :for_upsert, columns: [:data, :type] }
    end

    private

    attr_reader :service

    def client
      @client ||= Rescuetime::Client.new(api_key: service.api_key)
    end
  end
end
