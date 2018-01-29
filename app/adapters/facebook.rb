# frozen_string_literal: true

module Facebook
  class << self
    def new(*args)
      Facebook::Adapter.new(*args)
    end
  end
end
