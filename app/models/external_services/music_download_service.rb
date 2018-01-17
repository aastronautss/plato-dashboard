# frozen_string_literal: true

##
# A STI class for ExternalService that encompasses the logic for music download services.
#
class MusicDownloadService < ExternalService
  APPS = %w[Headphones].freeze
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'music_download_service', 'data.json').to_s.freeze

  enum app: APPS

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  def host
    data[:host]
  end

  def port
    data[:port]
  end

  def http_root
    data[:http_root]
  end

  def api_key
    data[:api_key]
  end
end
