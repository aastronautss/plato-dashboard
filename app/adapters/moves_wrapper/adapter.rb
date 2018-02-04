# frozen_string_literal: true

module MovesWrapper
  class Adapter
    class << self
      def new_client(access_token)
        Moves::Client.new(access_token)
      end

      def generate_auth_url(callback_url: nil)
        oauth_client.auth_code.authorize_url(
          redirect_uri: callback_url,
          scope: 'activity location'
        )
      end

      def fetch_new_auth_data(callback_code, callback_url: nil)
        oauth_client.auth_code.get_token(callback_code, redirect_uri: callback_url)
      end

      protected

      def oauth_client
        OAuth2::Client.new(
          ENV['MOVES_API_KEY'],
          ENV['MOVES_API_SECRET'],
          site: 'https://api.moves-app.com',
          authorize_url: 'https://api.moves-app.com/oauth/v1/authorize',
          token_url: 'https://api.moves-app.com/oauth/v1/access_token'
        )
      end
    end

    def initialize(service)
      @service = service
      set_client
    end

    def confirm(params)
      result = ConfirmMovesService.new(service, params).call
      set_client

      result
    end

    def get_scrobbles(from: Date.today, to: Date.today)
      scrobble_data = client.daily_storyline trackPoints: true, from: from, to: to
      scrobble_data.map { |data_h| data_h.with_indifferent_access[:segments] }
    rescue RestClient::BadRequest => e
      nil
    end

    def import_scrobbles(scrobble_data)
      scrobbles = MovesWrapper::Scrobble.from_api(service, scrobble_data)
      scrobbles = scrobbles.uniq { |scrobble| scrobble.scrobbled_at }

      LocationScrobble.import scrobbles,
        on_duplicate_key_update: { constraint_name: :for_upsert, columns: [:data, :type] }
    end

    private

    attr_reader :client, :service

    def set_client
      @client = self.class.new_client(service.access_token)
    end
  end
end
