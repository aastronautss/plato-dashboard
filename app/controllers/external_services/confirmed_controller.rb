# frozen_string_literal: true

class ExternalServices::ConfirmedController < ApplicationController
  before_action :set_service

  def create
    @service.update confirmed: true

    redirect_to external_services_path
  end

  private

  def set_service
    @service = ExternalService.find params[:external_service_id]
  end
end
