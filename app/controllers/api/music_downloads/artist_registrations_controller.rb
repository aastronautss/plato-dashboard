# frozen_string_literal: true

##
# Interface for registering and deregistering artists.
#
class Api::MusicDownloads::ArtistRegistrationsController < ApplicationController
  before_action :set_service

  def index
    @artists = @service.adapter.get_index

    head :no_content # TODO
  end

  def create
    result = @service.adapter.add_artist registration_params

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
