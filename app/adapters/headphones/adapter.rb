# frozen_string_literal: true

require 'hphones'

module Headphones
  ##
  # An API wrapper for the Headphones API gem. At this point, it's just a straight pass-through, but as the app evolves
  # I can add more functionality.
  #
  class Adapter
    def initialize(service)
      @client = Hphones.new(
        host: service.host, port: service.port, http_root: service.http_root, api_key: service.api_key
      )
    end

    def method_missing(mth, *args, &blk)
      if client.respond_to? mth
        deserialize client.send(mth, *args, &blk)
      else
        super
      end
    end

    def respond_to_missing?(mth, *)
      client.respond_to?(mth) || super
    end

    def find_artist(params = {})
      hashes = deserialize(client.find_artist(params)).map(&:with_indifferent_access)
      hashes
    end

    private

    attr_reader :client

    def deserialize(response)
      response.data
    end
  end
end
