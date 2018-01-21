# frozen_string_literal: true

class ExternalServicesController < ApplicationController
  def index
    @music_scrobble_services = MusicScrobbleService.all
  end

  def create
    service = CreateLastFmService.new.call
    redirect_to service.auth_url
  end
end
