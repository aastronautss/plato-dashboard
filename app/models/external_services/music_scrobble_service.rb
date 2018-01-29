# frozen_string_literal: true

##
# A STI class for ExternalService that encompasses the logic for music download services.
#
class MusicScrobbleService < ExternalService
  ADAPTER = LastFm
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'music_scrobble_service', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  def confirmed?
    session.present?
  end

  def session
    data[:session]
  end

  def username
    data[:username]
  end
end
