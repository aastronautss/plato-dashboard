# frozen_string_literal: true

module Facebook
  class Adapter
    class InvalidPlaceError < StandardError; end

    def initialize
      @client = Koala::Facebook::API.new(Koala.config.app_access_token)
    end

    def get_place(place_id)
      client.get_object place_id, fields: ['name', 'description', 'category_list']
    rescue Koala::Facebook::ClientError => e
      raise InvalidPlaceError, e.message
    end

    private

    attr_reader :client
  end
end
