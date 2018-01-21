# frozen_string_literal: true

class ConfirmLastFmService
  def initialize(service, callback_token)
    @service = service
    @callback_token = callback_token
  end

  def call
    session_data = LastFm.fetch_new_session_data(callback_token)
    session_key = session_data['key']
    username = session_data['name']

    service.update data: service.data.merge({ session: session_key, username: username })
  end

  private

  attr_reader :service, :callback_token
end
