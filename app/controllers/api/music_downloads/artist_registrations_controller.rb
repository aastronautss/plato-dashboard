# frozen_string_literal: true

##
# Interface for registering and deregistering artists.
#
class Api::MusicDownloads::ArtistRegistrationsController < Api::ApplicationController
  before_action :set_service

  def index
    @artists = @service.adapter.get_index

    render json: @artists
  end

  def create
    @service.adapter.add_artist registration_params

    head :no_content # TODO
  end

  def destroy
    @service.adapter.add_artist id: params[:id]

    head :no_content # TODO
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end

  def registration_params
    params.require(:registration).permit(:id)
  end
end
