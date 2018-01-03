# frozen_string_literal: true

module Headphones
  ##
  # Data object for a Track
  #
  # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
  class Track
    class << self
      def from_api(props = {})
        formatted_props = {
          id: props['TrackID'],
          title: props['TrackTitle'],

          number: props['TrackNumber'],
          duration: props['TrackDuration'],
          bit_rate: props['BitRate'],

          location: props['Location'],
          format: props['Format']
        }.with_indifferent_access

        new(formatted_props)
      end
    end

    attr_reader :id, :title,
      :number, :duration, :bit_rate,
      :location, :format

    def initialize(props = {})
      @id = props[:id]
      @title = props[:title]

      @number = props[:number]
      @duration = props[:duration]
      @bit_rate = props[:bit_rate]

      @location = props[:location]
      @format = props[:format]
    end
  end
  # rubocop:enable Metrics/MethodLength, Metrics/AbcSize
end
