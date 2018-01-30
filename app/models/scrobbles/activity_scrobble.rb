# frozen_string_literal: true

##
# An omnivorous activity scrobble. Represents motion, computer usage, workouts, and more.
#
class ActivityScrobble < Scrobble
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'activity_scrobble', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }
end
