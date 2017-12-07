require 'hphones'

module Headphones
  class << self
    def method_missing(mth, *args, &blk)
      if headphones_api.respond_to? mth
        headphones_api.send mth, *args, &blk
      else
        super
      end
    end

    def respond_to_missing?(mth, *)
      headphones_api.respond_to?(mth) || super
    end

    private

    def headphones_api
      @headphones_api ||=
        Hphones.new(host: ENV['HEADPHONES_HOST'], port: ENV['HEADPHONES_PORT'], api_key: ENV['HEADPHONES_API_KEY'])
    end
  end
end
