# frozen_string_literal: true

require 'hphones'

module Headphones
  ##
  # An API wrapper for the Headphones API gem. By default, passes stuff straight through to the Hphones gem.
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

    def get_index(params = {})
      hashes = deserialize(client.get_index(params)).map(&:with_indifferent_access)
      hashes.map { |props| Headphones::Artist.from_api props }
    end

    def find_artist(params = {})
      hashes = deserialize(client.find_artist(params)).map(&:with_indifferent_access)
      hashes.map { |props| Headphones::ArtistSearchResult.new props }
    end

    def get_artist(params = {})
      props = deserialize(client.get_artist(params)).with_indifferent_access
      Headphones::Artist.from_api props
    end

    def add_artist(params = {})
      deserialize client.add_artist(params)
    end

    def get_wanted(params = {})
      hashes = deserialize(client.get_wanted(params)).map(&:with_indifferent_access)
      hashes.map { |props| Headphones::Album.from_api props }
    end

    def find_album(params = {})
      hashes = deserialize(client.find_album(params)).map(&:with_indifferent_access)
      hashes.map { |props| Headphones::AlbumSearchResult.new props }
    end

    def add_album(params = {})
      deserialize client.queue_album(params)
    end

    def remove_album(params = {})
      deserialize client.unqueue_album(params)
    end

    private

    attr_reader :client

    def deserialize(response)
      response.data
    end
  end
end
