# frozen_string_literal: true

class Api::MusicDownloads::ArtistsController < ApplicationController
  before_action :set_service

  def index
    @artists = @service.adapter.get_index
  end

  def search
    @results = @service.adapter.find_artist name: params[:q]
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
