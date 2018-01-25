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

    private

    attr_reader :service

    def client
      @client ||= Rescuetime::Client.new(api_key: service.api_key)
    end

    def get_scrobbles(to: nil, from: nil)
      client.activities.format(:array).order_by(:time, interval: :minute).from(from).to(to)
    end
  end
end
