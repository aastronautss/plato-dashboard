# frozen_string_literal: true

class CreateService
  SERVICES = {
    lastfm: CreateLastFmService
  }

  def initialize(service_id, params = {})
    @service = lookup service_id
    @params = params
  end

  def call
    new_service = service.new(params)
    new_service.call

    new_service
  end

  private

  attr_reader :service, :params

  def lookup(service_id)
    SERVICES[service_id.to_sym]
  end
end
