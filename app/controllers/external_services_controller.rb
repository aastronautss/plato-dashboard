# frozen_string_literal: true

class ExternalServicesController < ApplicationController
  def index
    @music_scrobble_services = MusicScrobbleService.all
    @activity_services = []
  end

  def create
    service = CreateService.new(params[:service], external_service_params).call
    redirect_to service.auth_url
  end

  private

  def external_service_params
    params.require(:external_service).permit()
  end
end
