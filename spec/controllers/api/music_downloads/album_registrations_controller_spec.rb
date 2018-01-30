# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::AlbumRegistrationsController do
  let(:service) { create :headphones_service }

  describe 'GET :index', :vcr do
    let(:action) do
      get :index,
        format: :json,
        params: { service_id: service.id }
    end

    it_behaves_like 'an instance variable setter', :service, :albums
  end

  describe 'POST :create', :vcr do
    let(:action) do
      post :create,
        format: :json,
        params: { service_id: service.id, registration: { id: '8a103b36-a632-425f-8980-da934b0c1eb3' } }
    end

    it_behaves_like 'an instance variable setter', :service
  end

  describe 'DELETE :destroy', :vcr do
    let(:action) do
      delete :destroy,
        format: :json,
        params: { service_id: service.id, id: '8a103b36-a632-425f-8980-da934b0c1eb3' }
    end

    it_behaves_like 'an instance variable setter', :service
  end
end
