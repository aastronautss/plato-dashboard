# frozen_string_literal: true

class ExternalServicesController < ApplicationController
  def index
    @music_scrobble_services = LastFmService.all
    @activity_services = RescueTimeService.all
    @moves_services = MovesService.all
    @social_services = FacebookService.all

    @new_music_scrobble_service = LastFmService.new
    @new_rescue_time_service = RescueTimeService.new
    @new_moves_service = MovesService.new
    @new_facebook_service = FacebookService.new
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
