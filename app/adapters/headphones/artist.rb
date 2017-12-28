# frozen_string_literal: true

module Headphones
  ##
  # A duck-type data object for a music artist.
  #
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  class Artist
    class << self
      def from_api(props = {})
        albums = props[:albums] || []

        description_hash = props[:description]&.first || {}
        artist_hash = props[:artist]&.first || {}

        formatted_props = {
          id: artist_hash['ArtistId'],
          name: artist_hash['ArtistName'],

          summary: description_hash['Summary'],
          description: description_hash['Content'],

          status: artist_hash['Status'],
          total_tracks: artist_hash['TotalTracks'],
          have_tracks: artist_hash['HaveTracks'],

          image_thumbnail_url: artist_hash['ThumbURL'],
          image_url: artist_hash['ArtworkURL'],

          albums: format_albums(albums)
        }.with_indifferent_access

        new(formatted_props)
      end

      private

      def format_albums(album_hashes)
        album_hashes.map { |h| formatted_album_hash h }
      end

      def formatted_album_hash(album_hash)
        {
          id: album_hash['AlbumID'],
          asin: album_hash['AlbumASIN'],

          title: album_hash['AlbumTitle'],
          release_date: album_hash['ReleaseDate'],
          type: album_hash['Type'],

          critic_score: album_hash['CriticScore'],
          user_score: album_hash['UserScore'],

          artwork_thumbnail_url: album_hash['ThumbURL'],
          artwork_url: album_hash['ArtworkURL'],

          status: album_hash['Status']
        }.with_indifferent_access
      end
    end

    attr_reader :name, :id, :url,
      :summary, :description,
      :status, :total_tracks, :have_tracks,
      :image_thumbnail_url, :image_url,
      :albums

    def initialize(props = {})
      @id = props[:id]
      @name = props[:name]
      @url = props[:url]

      @summary = props[:summary]
      @description = props[:description]

      @status = props[:status]
      @total_tracks = props[:total_tracks]
      @have_tracks = props[:have_tracks]

      @image_thumbnail_url = props[:image_thumbnail_url]
      @image_url = props[:image_url]

      @albums = populate_albums(props[:albums])
    end

    private

    def populate_albums(album_hashes)
      album_hashes&.map { |props| Headphones::Album.new(props) }
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
