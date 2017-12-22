# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::ArtistsController do
  let(:service) { create :music_download_service }

  describe 'GET :search', :vcr do
    let(:action) { get :search, format: :json, params: { service_id: service.id, q: 'alt j' } }

    it_behaves_like 'an instance variable setter', :service, :results
  end

  describe 'GET :show', :vcr do
    let(:action) do
      get :show,
        format: :json,
        params: { service_id: service.id, id: 'fc7bbf00-fbaa-4736-986b-b3ac0266ca9b' }
    end

    it_behaves_like 'an instance variable setter', :service, :artist
  end
end
