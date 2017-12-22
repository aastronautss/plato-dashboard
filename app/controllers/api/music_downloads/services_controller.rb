# frozen_string_literal: true

##
# Controller for managing music download services.
#
class Api::MusicDownloads::ServicesController < ApplicationController
  def index
    @services = MusicDownloadService.all
  end

  def create
    @service = MusicDownloadService.new service_params

    @service.save
  end

  private

  def service_params
    params.require(:music_download_service).permit(
      :app, :label,
      data: [:protocol, :host, :port, :http_root, :api_key]
    )
  end
end
