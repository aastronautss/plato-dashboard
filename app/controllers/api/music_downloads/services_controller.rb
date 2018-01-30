# frozen_string_literal: true

##
# Controller for managing music download services.
#
class Api::MusicDownloads::ServicesController < Api::ApplicationController
  def index
    @services = HeadphonesService.all

    render json: @services
  end

  def create
    @service = HeadphonesService.new service_params

    if @service.save
      render json: @service
    else
      head :unprocessable_entity
    end
  end

  private

  def service_params
    params.require(:music_download_service).permit(
      :app, :label,
      data: [:protocol, :host, :port, :http_root, :api_key]
    )
  end
end
