# frozen_string_literal: true

##
# Interface for finding and choosing releases.
#
class Api::MusicDownloads::AlbumReleasesController < ApplicationController
  before_action :set_service

  def index
    # TODO
  end

  def choose
    # TODO
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
