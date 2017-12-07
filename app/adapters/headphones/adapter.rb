# frozen_string_literal: true

require 'hphones'

module Headphones
  ##
  # An API wrapper for the Headphones API gem. At this point, it's just a straight pass-through, but as the app evolves
  # I can add more functionality.
  #
  class Adapter
    HOST = ENV['HEADPHONES_HOST']
    PORT = ENV['HEADPHONES_PORT']
    API_KEY = ENV['HEADPHONES_API_KEY']

    def initialize
      @client = Hphones.new(host: HOST, port: PORT, api_key: API_KEY)
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

    private

    attr_reader :client

    def deserialize(response)
      response.data
    end
  end
end
