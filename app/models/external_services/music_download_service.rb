# frozen_string_literal: true

##
# A STI class for ExternalService that encompasses the logic for music download services.
#
class MusicDownloadService < ExternalService
  NAMES = ['Headphones'].freeze
  DATA_JSON_SCHEMA = Rails.root.join('config', 'schemas', 'music_download_service', 'data.json_schema').to_s

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  enum name: NAMES

  class << self
    def names
      NAMES
    end

    alias available_services names
  end
end
