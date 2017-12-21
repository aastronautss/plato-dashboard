# frozen_string_literal: true

module Headphones
  ##
  # Wrapper class for Artist with semantics for search results.
  #
  class ArtistSearchResult
    attr_reader :artist, :score

    def initialize(props = {})
      @artist = Headphones::Artist.new(props)
      @score = props[:score]
    end

    def id
      artist.id
    end

    def name
      artist.name
    end

    def url
      artist.url
    end
  end
end
