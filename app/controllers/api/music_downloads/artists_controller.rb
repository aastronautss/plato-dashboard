# frozen_string_literal: true

class Api::MusicDownloads::ArtistsController < ApplicationController
  before_action :set_service

  def search
    @results = @service.adapter.find_artist name: params[:q]

    head :no_content # TODO
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
