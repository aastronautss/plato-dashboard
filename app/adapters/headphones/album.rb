# frozen_string_literal: true

module Headphones
  ##
  # A duck-type data object for a music album.
  #
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  class Album
    class << self
      def from_api(props = {})
        formatted_props = {
          id: props['AlbumID'],
          asin: props['AlbumASIN'],

          title: props['AlbumTitle'],
          release_date: props['ReleaseDate'],
          type: props['Type'],

          summary: props['Summary'],
          description: props['Description'],

          critic_score: props['CriticScore'],
          user_score: props['UserScore'],

          artwork_thumbnail_url: props['ThumbURL'],
          artwork_url: props['ArtworkURL'],

          status: props['Status'],

          artist: format_artist(props),
          tracks: format_tracks(props)
        }.with_indifferent_access

        new(formatted_props)
      end

      private

      def format_artist(props)
        {
          id: props['ArtistID'],
          name: props['ArtistName']
        }.with_indifferent_access
      end

      def format_tracks(props)
        props[:tracks]
      end
    end

    attr_reader :id, :asin, :url,
      :title, :release_date, :type,
      :critic_score, :user_score,
      :artwork_thumbnail_url, :artwork_url,
      :status,
      :artist

    def initialize(props = {})
      @id = props[:id]
      @asin = props[:asin]
      @url = props[:url]

      @title = props[:title]
      @release_date = props[:release_date]
      @type = props[:type]

      @critic_score = props[:critic_score]
      @user_score = props[:user_score]

      @artwork_thumbnail_url = props[:artwork_thumbnail_url]
      @artwork_url = props[:artwork_url]

      @status = props[:status]

      @artist = populate_artist(props[:artist]) if props[:artist]
    end

    private

    def populate_artist(props)
      Headphones::Artist.new(props)
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
