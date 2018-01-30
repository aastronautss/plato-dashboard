# frozen_string_literal: true

##
# An omnivorous music scrobble.
#
class MusicScrobble < Scrobble
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'music_scrobble', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }
end
