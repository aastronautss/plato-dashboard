# frozen_string_literal: true

module Headphones
  ##
  # Data objects for "artist."
  #
  class Artist
    attr_reader :name, :id, :url

    def initialize(props = {})
      @id = props[:id]
      @name = props[:name]
      @url = props[:url]
    end
  end
end
