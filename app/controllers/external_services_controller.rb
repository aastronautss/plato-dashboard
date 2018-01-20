# frozen_string_literal: true

class ExternalServicesController < ApplicationController
  def index
    @music_scrobble_services = MusicScrobbleService.all
  end

  def create
    service = CreateLastFmService.new.call
    @external_service_activation_url = service.auth_url

    render :index
  end
end
