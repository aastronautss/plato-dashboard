# frozen_string_literal: true

module Headphones
  ##
  # Wrapper class for Artist with semantics for search results.
  #
  class AlbumSearchResult
    attr_reader :album, :score

    def initialize(props = {})
      @album = Headphones::Album.new(album_props(props))
      @score = props[:score]
    end

    def id
      album.id
    end

    def title
      album.title
    end

    def url
      album.url
    end

    private

    def album_props(api_props)
      {
        id: api_props[:albumid],
        title: api_props[:title],
        url: api_props[:albumurl],

        artist: {
          id: api_props[:id],
          name: api_props[:uniquename],
          url: api_props[:url]
        }
      }
    end
  end
end
