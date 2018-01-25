# frozen_string_literal: true

##
# API wrapper for RescueTime
#
module RescueTime
  class << self
    def new(*args)
      RescueTime::Adapter.new(*args)
    end
  end
end
