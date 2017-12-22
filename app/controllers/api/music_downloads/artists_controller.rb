# frozen_string_literal: true

class Api::MusicDownloads::ArtistsController < ApplicationController
  before_action :set_service

  def index
    @artists = @service.adapter.get_index

    head :no_content
  end

  def search
    @results = @service.adapter.find_artist name: params[:q]

    head :no_content
  end

  def create
    result = @service.adapter.add_artist artist_params
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end

  def artist_params
    params.require(:artist).permit(:id)
  end
end
