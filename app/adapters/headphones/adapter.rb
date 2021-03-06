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
      deserialize(client.get_index(params)).map do |artist_hash|
        formatted_props = format_get_index_props(artist_hash)
        Headphones::Artist.from_api formatted_props
      end
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

    def get_upcoming(params = {})
      hashes = deserialize(client.get_upcoming(params)).map(&:with_indifferent_access)
      hashes.map { |props| Headphones::Album.from_api props }
    end

    def find_album(params = {})
      hashes = deserialize(client.find_album(params)).map(&:with_indifferent_access)
      hashes.map { |props| Headphones::AlbumSearchResult.new props }
    end

    def get_album(params = {})
      props = deserialize(client.get_album(params)).with_indifferent_access
      formatted_props = format_get_album_props(props)

      Headphones::Album.from_api formatted_props
    end

    def add_album(params = {})
      deserialize client.queue_album(params)
    end

    def remove_album(params = {})
      deserialize client.unqueue_album(params)
    end

    def get_album_releases(params = {})
      deserialize client.choose_specific_download(params)
    end

    def choose_album_release(params = {})
      deserialize client.download_specific_release(params)
    end

    private

    attr_reader :client

    def deserialize(response)
      response.data
    end

    def format_get_index_props(props)
      { artist: [props] }
    end

    def format_get_album_props(props)
      description_props = props[:description][0]

      props[:album][0].merge(
        'Summary' => description_props && description_props['Summary'],
        'Description' => description_props && description_props['Description'],

        tracks: props[:tracks]
      ).with_indifferent_access
    end
  end
end
