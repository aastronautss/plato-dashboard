# frozen_string_literal: true

require 'lastfm'

module LastFm
  ##
  # An API wrapper for the +lastfm+ gem. Provides semantics for application-specific stuff regarding music scrobbles.
  #
  class Adapter
    DEFAULT_SCROBBLE_PAGE_LIMIT = 200

    class << self
      def new_client
        Lastfm.new(api_key, api_secret)
      end

      def generate_auth_url(callback_url: nil)
        "https://www.last.fm/api/auth/?api_key=#{api_key}&cb=#{callback_url}"
      end

      def fetch_new_session_data(token)
        new_client.auth.get_session(token: token)
      end

      private

      def api_key
        ENV['LASTFM_API_KEY']
      end

      def api_secret
        ENV['LASTFM_API_SECRET']
      end
    end

    def initialize(service)
      @service = service
      @client = self.class.new_client

      client.session = service.session
    end

    def get_scrobbles(to: nil, from: nil, limit: DEFAULT_SCROBBLE_PAGE_LIMIT)
      scrobble_data = client.user.get_recent_tracks user: service.username, to: to, from: from, limit: limit

      scrobble_data &&
        scrobble_data.select { |scrobble_data| scrobble_data['nowplaying'] != 'true'}
    end

    def import_scrobbles(scrobble_data)
      scrobble_data = Array(scrobble_data)
      scrobbles = scrobble_data.map { |scrobble_hash| LastFm::Scrobble.from_api(service, scrobble_hash) }
        .uniq { |scrobble| [scrobble.external_service_id, scrobble.scrobbled_at] }

      MusicScrobble.import scrobbles,
        on_duplicate_key_update: { constraint_name: :for_upsert, columns: [:data, :type] }
    end

    private

    attr_reader :client, :service
  end
end
