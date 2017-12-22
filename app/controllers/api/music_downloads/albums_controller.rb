# frozen_string_literal: true

class Api::MusicDownloads::ArtistsController < ApplicationController
  before_action :set_service

  def create

  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
