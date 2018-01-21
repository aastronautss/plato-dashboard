# frozen_string_literal: true

##
# An API wrapper for LastFm
#
module LastFm
  class << self
    def new(*args)
      LastFm::Adapter.new(*args)
    end

    def generate_auth_url(*args)
      LastFm::Adapter.generate_auth_url(*args)
    end

    def fetch_new_session_data(token)
      LastFm::Adapter.fetch_new_session_data(token)
    end
  end
end
