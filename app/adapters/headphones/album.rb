# frozen_string_literal: true

module Headphones
  ##
  # A duck-type data object for a music album.
  #
  class Album
    attr_reader :id, :asin,
      :title, :release_date, :type,
      :critic_score, :user_score,
      :artwork_thumbnail_url, :artwork_url,
      :status

    def initialize(props = {})
      @id = props[:id]
      @asin = props[:asin]

      @title = props[:title]
      @release_date = props[:release_date]
      @type = props[:type]

      @critic_score = props[:critic_score]
      @user_score = props[:user_score]

      @artwork_thumbnail_url = props[:artwork_thumbnail_url]
      @artwork_url = props[:artwork_url]

      @status = props[:status]
    end
  end
end
