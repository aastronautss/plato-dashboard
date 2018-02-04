# frozen_string_literal: true

module Facebook
  class Adapter
    class InvalidPlaceError < StandardError; end

    PERMISSIONS = %w[email public_profile user_posts user_photos]
    PLACE_FIELDS = %w[name description category_list]

    class << self
      def generate_auth_url(callback_url: nil)
        oauth_client.url_for_oauth_code(
          permissions: PERMISSIONS,
          redirect_uri: callback_url
        )
      end

      def fetch_new_auth_data(callback_code, callback_url: nil)
        oauth_client.get_access_token_info(callback_code, redirect_uri: callback_url)
      end

      private

      def oauth_client
        Koala::Facebook::OAuth.new
      end
    end

    def initialize(service = nil)
      @service = service
      set_client
    end

    def confirm(params)
      result = ConfirmFacebookService.new(service, params).call
      set_client

      result
    end

    def get_place(place_id)
      client.get_object place_id, fields: PLACE_FIELDS
    rescue Koala::Facebook::ClientError => e
      raise InvalidPlaceError, e.message
    end

    private

    attr_reader :client, :service, :token

    def set_client
      @token = service&.access_token || Koala.config.app_access_token
      @client = Koala::Facebook::API.new(@token)
    end
  end
end
