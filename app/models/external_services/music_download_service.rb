# frozen_string_literal: true

class MusicDownloadService < ExternalService
  NAMES = ['Headphones']
  DATA_JSON_SCHEMA = Rails.root.join('config', 'schemas', 'music_download_service', 'data.json_schema').to_s

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  enum name: NAMES

  class << self
    def names
      NAMES
    end

    alias_method :available_services, :names
  end
end
