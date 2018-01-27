# frozen_string_literal: true

class CreateRescueTimeService
  DEFAULT_LABEL = 'RescueTime'

  def initialize(params = {})
    @params = params
  end

  def call
    RescueTimeService.create(params)

    self
  end

  def auth_url
    '/external_services'
  end

  private

  attr_reader :params
end
