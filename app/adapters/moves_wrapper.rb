# frozen_string_literal: true

module MovesWrapper
  class << self
    def new(*args)
      MovesWrapper::Adapter.new(*args)
    end

    def generate_auth_url(*args)
      MovesWrapper::Adapter.generate_auth_url(*args)
    end

    def fetch_new_auth_data(*args)
      MovesWrapper::Adapter.fetch_new_auth_data(*args)
    end
  end
end
