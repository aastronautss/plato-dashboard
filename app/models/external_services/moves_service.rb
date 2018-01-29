# frozen_string_literal: true

class MovesService < ExternalService
  ADAPTER = MovesWrapper
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'moves_service', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  def confirmed?
    access_token.present?
  end

  def access_token
    data[:access_token]
  end

  def refresh_token
    data[:refresh_token]
  end
end
