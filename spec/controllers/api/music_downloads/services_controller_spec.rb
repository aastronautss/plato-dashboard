# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::ServicesController do
  describe 'GET :index' do
    let(:action) { get :index, format: :json }

    before { create :headphones_service }

    it_behaves_like 'an instance variable setter', :services

    it do
      action
      should respond_with(200...300)
    end
  end

  describe 'POST :create' do
    let(:params) { { music_download_service: attributes_for(:headphones_service) } }
    let(:action) { post :create, format: :json, params: params }

    it_behaves_like 'an instance variable setter', :service

    it 'creates a new ExternalService' do
      expect { action }.to change { ExternalService.count }.by(1)
    end
  end
end
