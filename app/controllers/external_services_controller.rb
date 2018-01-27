# frozen_string_literal: true

class ExternalServicesController < ApplicationController
  def index
    @music_scrobble_services = MusicScrobbleService.all
    @activity_services = ActivityScrobbleService.all

    @new_music_scrobble_service = MusicScrobbleService.new
    @new_rescue_time_service = RescueTimeService.new
  end

  def create
    service = CreateService.new(params[:service], external_service_params).call
    redirect_to service.auth_url
  end

  private

  def external_service_params
    params.require(:external_service).permit(:label, data: {})
  end
end
