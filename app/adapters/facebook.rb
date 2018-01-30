# frozen_string_literal: true

module Facebook
  class << self
    def new(*args)
      Facebook::Adapter.new(*args)
    end

    def new_with_service(service)
      Facebook::UserAdapter.new(service)
    end

    def generate_auth_url(*args)
      Facebook::Adapter.generate_auth_url(*args)
    end
  end
end
