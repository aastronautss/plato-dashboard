# frozen_string_literal: true

##
# Find and interact with MusicDownloads Artists
#
class Api::MusicDownloads::ArtistsController < Api::ApplicationController
  before_action :set_service

  def search
    @results = @service.adapter.find_artist name: params[:q]

    render json: @results
  end

  def show
    @artist = @service.adapter.get_artist id: params[:id]

    head :no_content # TODO
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
