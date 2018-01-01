# frozen_string_literal: true

##
# Find and interact with MusicDownloads albums
#
class Api::MusicDownloads::AlbumsController < Api::ApplicationController
  before_action :set_service

  def search
    @results = @service.adapter.find_album name: params[:q]

    render json: @results # TODO
  end

  def index
    @albums = @service.adapter.get_upcoming

    render json: @albums # TODO
  end

  def show
    @album = @service.adapter.get_album id: params[:id]

    head :no_content # TODO
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
