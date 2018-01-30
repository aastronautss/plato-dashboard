# frozen_string_literal: true

##
# Controller for managing music scrobbling services.
#
class Api::MusicScrobbles::ServicesController < Api::ApplicationController
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

    private

    def service_params
      params.require(:music_scrobble_service).permit(:app, :label, data: [:token])
    end
  end
end
