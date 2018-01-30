# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::AlbumsController do
  let(:service) { create :headphones_service }

  describe 'GET :search', :vcr do
    let(:action) { get :search, format: :json, params: { service_id: service.id, q: 'masseduction' } }

    it_behaves_like 'an instance variable setter', :service, :results
  end

  describe 'GET :index', :vcr do
    let(:action) { get :index, format: :json, params: { service_id: service.id } }

    it_behaves_like 'an instance variable setter', :service, :albums
  end

  describe 'GET :show', :vcr do
    let(:action) do
      get :show, format: :json, params: { service_id: service.id, id: '8a103b36-a632-425f-8980-da934b0c1eb3' }
    end

    it_behaves_like 'an instance variable setter', :service, :album
  end
end
