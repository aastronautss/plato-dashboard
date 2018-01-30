# frozen_string_literal: true

class CreateService
  SERVICES = {
    lastfm: CreateLastFmService,
    rescuetime: CreateRescueTimeService,
    moves: CreateMovesService,
    facebook: CreateFacebookService
  }

  def initialize(service_id, params = {})
    @service_creator = lookup service_id
    @params = params
  end

  def call
    creator = service_creator.new(params)
    new_service = creator.call

    new_service
  end

  private

  attr_reader :service_creator, :params

  def lookup(service_id)
    SERVICES[service_id.to_sym]
  end
end
