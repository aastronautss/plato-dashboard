# frozen_string_literal: true

##
# Find and interact with MusicDownloads albums
#
class Api::MusicDownloads::AlbumsController < ApplicationController
  before_action :set_service

  def search
    # TODO
  end

  def index
    # TODO: upcoming
  end

  def show
    # TODO
  end

  private

  def set_service
    @service = MusicDownloadService.find params[:service_id]
  end
end
