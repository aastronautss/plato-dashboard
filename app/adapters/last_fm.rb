# frozen_string_literal: true

##
# An API wrapper for LastFm
#
module LastFm
  class << self
    def new(*args)
      LastFm::Adapter.new(*args)
    end

    def generate_token
      LastFm::Adapter.generate_token
    end

    def generate_auth_url(*args)
      LastFm::Adapter.generate_auth_url(*args)
    end
  end
end
