# frozen_string_literal: true

##
# An omnivorous location scrobble.
#
class LocationScrobble < Scrobble
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'location_scrobble', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }
end
