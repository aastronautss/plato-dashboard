# frozen_string_literal: true

class ExternalServices::ConfirmedController < ApplicationController
  before_action :set_service

  def create
    code = params[:code]
    ConfirmMovesService.new(@service, code).call
    # token = params[:token]
    # ConfirmLastFmService.new(@service, token).call

    redirect_to external_services_path
  end

  private

  def set_service
    @service = ExternalService.find params[:external_service_id]
  end
end
