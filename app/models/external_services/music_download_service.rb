# frozen_string_literal: true

##
# A STI class for ExternalService that encompasses the logic for music download services.
#
class MusicDownloadService < ExternalService
  NAMES = %w[Headphones].freeze
  DATA_JSON_SCHEMA = Rails.root.join('config', 'schemas', 'music_download_service', 'data.json_schema').to_s.freeze

  enum name: NAMES

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  class << self
    def names
      NAMES
    end

    alias available_services names
  end

  def data
    read_attribute(:data).with_indifferent_access
  end

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
