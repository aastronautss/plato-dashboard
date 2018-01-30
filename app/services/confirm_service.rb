# frozen_string_literal: true

class ConfirmService
  def initialize(service, params)
    @service = service
    @params = params
  end

  def call
    service.adapter.confirm(params)
  end

  private

  attr_reader :service, :params
end
