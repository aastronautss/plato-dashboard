# frozen_string_literal: true

class CreateLastFmService
  include Rails.application.routes.url_helpers

  DEFAULT_LABEL = 'last.fm'

  attr_reader :auth_url

  def initialize(label = DEFAULT_LABEL)
    @label = label
  end

  def call
    callback_url = external_service_confirm_url(service.id)
    @auth_url = LastFm.generate_auth_url(callback_url: CGI.escape(callback_url))

    self
  end

  private

  attr_reader :label

  def token
    @token ||= LastFm.generate_token
  end

  def service
    @service ||= MusicScrobbleService.create(
      app: 'LastFm', label: label, confirmed: true, data: { token: token }
    )
  end
end
