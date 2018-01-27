# frozen_string_literal: true

class RescueTimeService < ActivityScrobbleService
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'rescue_time_service', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  before_validation :set_app

  def set_app
    self.app = self.class.superclass::APPS['RescueTime']
  end

  def api_key
    data[:api_key]
  end

  def confirmed?
    api_key.present?
  end
end
