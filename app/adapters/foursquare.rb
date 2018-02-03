# frozen_string_literal: true

##
# Top-level namespace for Foursquare
#
module Foursquare
  class << self
    def new(*args)
      Foursquare::Adapter.new(*args)
    end
  end
end
