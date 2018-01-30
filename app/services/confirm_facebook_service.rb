# frozen_string_literal: true

class ConfirmFacebookService
  include Rails.application.routes.url_helpers

  def initialize(service, params)
    @service = service
    @params = params
  end

  def call
    auth_data = Facebook::Adapter.fetch_new_auth_data(params[:code], callback_url: callback_url)
      .with_indifferent_access

    access_token = auth_data[:access_token]
    access_token_expires_on = auth_data[:expires_in].seconds.from_now

    service.update(
      data: service.data.merge({access_token: access_token, access_token_expires_on: access_token_expires_on})
    )
  end

  private

  attr_reader :service, :params

  def callback_url
    confirm_external_services_url(external_service_id: service.id)
  end
end
