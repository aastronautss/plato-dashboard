# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::ArtistsController do
  describe 'GET :index' do
    let(:service) { create :music_download_service }
    let(:action) { get :index, params: { service_id: service.id } }

    it_behaves_like 'an instance variable setter', :service, :artists
  end
end
