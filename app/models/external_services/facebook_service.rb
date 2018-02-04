# frozen_string_literal: true

class FacebookService < ExternalService
  ADAPTER = Facebook
  DATA_JSON_SCHEMA = Rails.root.join('app', 'schemas', 'facebook_service', 'data.json').to_s.freeze

  validates :data, json: { schema: DATA_JSON_SCHEMA }

  def confirmed?
    access_token.present?
  end

  def access_token
    data[:access_token]
  end

  def access_token_expires_on
    Time.parse data[:access_token_expires_on]
  end
end
