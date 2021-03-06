# frozen_string_literal: true

##
# Interface for registering and deregistering albums.
#
class Api::MusicDownloads::AlbumRegistrationsController < Api::ApplicationController
  before_action :set_service

  def index
    @albums = @service.adapter.get_wanted

    render json: @albums
  end

  def create
    @service.adapter.add_album registration_params

    head :no_content # TODO
  end

  def destroy
    @service.adapter.remove_album id: params[:id]

    head :no_content # TODO
  end

  private

  def set_service
    @service = HeadphonesService.find params[:service_id]
  end

  def registration_params
    params.require(:registration).permit(:id)
  end
end
