# frozen_string_literal: true

class CreateLastFmService
  include Rails.application.routes.url_helpers

  APP_NAME = 'LastFm'
  DEFAULT_LABEL = 'last.fm'

  attr_reader :auth_url

  def initialize(label: DEFAULT_LABEL)
    @label = label
  end

  def call
    @auth_url = LastFm.generate_auth_url(callback_url: callback_url)

    self
  end

  private

  attr_reader :label

  def service
    @service ||= MusicScrobbleService.create(app: APP_NAME, label: label, data: {})
  end

  def callback_url
    external_service_confirm_url(service.id)
  end
end
