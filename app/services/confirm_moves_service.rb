# frozen_string_literal: true

class ConfirmMovesService
  include Rails.application.routes.url_helpers

  def initialize(service, callback_code)
    @service = service
    @callback_code = callback_code
  end

  def call
    auth_data = MovesWrapper.fetch_new_auth_data(callback_code, callback_url: callback_url)
    access_token = auth_data.token
    refresh_token = auth_data.refresh_token

    service.update data: service.data.merge({ access_token: access_token, refresh_token: refresh_token })
  end

  private

  attr_reader :service, :callback_code

  def callback_url
    external_service_confirm_url(service.id)
  end
end
