# frozen_string_literal: true

require 'lastfm'

module LastFm
  ##
  # An API wrapper for the +lastfm+ gem. Provides semantics for application-specific stuff regarding music scrobbles.
  #
  class Adapter
    class << self
      def new_client
        Lastfm.new(api_key, api_secret)
      end

      def generate_auth_url(callback_url: nil)
        token = generate_token

        "http://www.last.fm/api/auth/?api_key=#{api_key}&token=#{token}&cb=#{callback_url}"
      end

      def generate_token
        new_client.auth.get_token
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
      @client = self.class.new_client
      @token = service.data[:token]

      set_session!
    end

    private

    attr_reader :client

    def set_session!
      client.session = client.auth.get_session(token: token)['key']
    end
  end
end
