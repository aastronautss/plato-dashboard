# frozen_string_literal: true

class CreateFacebookService
  include Rails.application.routes.url_helpers

  attr_reader :auth_url

  def initialize(params = {})
    @params = params
  end

  def call
    create_service
    set_auth_url

    self
  end

  private

  attr_reader :params, :service

  def label
    params[:label]
  end

  def create_service
    @service = FacebookService.create(label: label, data: {})
  end

  def set_auth_url
    @auth_url = Facebook.generate_auth_url(callback_url: callback_url)
  end

  def callback_url
    confirm_external_services_url(external_service_id: service.id)
  end
end
