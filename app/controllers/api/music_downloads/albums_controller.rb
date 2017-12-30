# frozen_string_literal: true

##
# Find and interact with MusicDownloads albums
#
class Api::MusicDownloads::AlbumsController < Api::ApplicationController
  before_action :set_service

  def search
    @results = @service.adapter.find_album name: params[:q]

    head :no_content # TODO
  end

  def index
    @albums = @service.adapter.get_upcoming

    head :no_content # TODO
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
