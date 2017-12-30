# frozen_string_literal: true

##
# Controller for managing music download services.
#
class Api::MusicDownloads::ServicesController < Api::ApplicationController
  def index
    @services = MusicDownloadService.all

    render json: @services
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
