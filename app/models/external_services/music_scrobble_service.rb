# frozen_string_literal: true

##
# A STI class for ExternalService that encompasses the logic for music download services.
#
class MusicScrobbleService < ExternalService
  APPS = %w[LastFm].freeze
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'music_scrobble_service', 'data.json').to_s.freeze

  enum app: APPS

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
