# frozen_string_literal: true

class RescueTimeService < ExternalService
  ADAPTER = RescueTime
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'rescue_time_service', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  def api_key
    data[:api_key]
  end

  def confirmed?
    api_key.present?
  end
end
