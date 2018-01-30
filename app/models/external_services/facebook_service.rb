# frozen_string_literal: true

class FacebookService < ExternalService
  ADAPTER = Facebook
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'moves_service', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  def access_token
    data[:access_token]
  end

  def access_token_expires_on
    data[:access_token_expires_on]
  end

  def confirmed?
    access_token.present?
  end
end
