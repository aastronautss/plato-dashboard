# frozen_string_literal: true

module Foursquare
  class << self
    def new(*args)
      Foursquare::Adapter.new(*args)
    end
  end
end
