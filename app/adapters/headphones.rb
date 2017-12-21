# frozen_string_literal: true

##
# Top-level namespace for the Headphones adapter
#
module Headphones
  class << self
    def new(*args)
      Headphones::Adapter.new(*args)
    end
  end
end
