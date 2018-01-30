# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::ArtistRegistrationsController do
  let(:service) { create :headphones_service }

  describe 'GET :index', :vcr do
    let(:action) { get :index, format: :json, params: { service_id: service.id } }

    it_behaves_like 'an instance variable setter', :service, :artists
  end

  describe 'POST :create', :vcr do
    let(:action) do
      post :create,
        format: :json,
        params: { service_id: service.id, registration: { id: 'fc7bbf00-fbaa-4736-986b-b3ac0266ca9b' } }
    end

    it_behaves_like 'an instance variable setter', :service
  end

  describe 'DELETE :destroy', :vcr do
    let(:action) do
      delete :destroy,
        format: :json,
        params: { service_id: service.id, id: 'fc7bbf00-fbaa-4736-986b-b3ac0266ca9b' }
    end

    it_behaves_like 'an instance variable setter', :service
  end
end
