# frozen_string_literal: true

module Foursquare
  class Adapter
    API_VERSION = '20180128'

    def initialize
      @client = Foursquare2::Client.new(
        client_id: ENV['FOURSQUARE_CLIENT_ID'],
        client_secret: ENV['FOURSQUARE_CLIENT_SECRET'],
        api_version: API_VERSION
      )
    end

    def get_place(place_id)
      client.venue(place_id)
    end

    private

    attr_reader :client
  end
end
