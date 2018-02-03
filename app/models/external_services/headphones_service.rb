# frozen_string_literal: true

##
# Data relating to the Headphones service
#
class HeadphonesService < ExternalService
  ADAPTER = Headphones
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'headphones_service', 'data.json').to_s.freeze

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
