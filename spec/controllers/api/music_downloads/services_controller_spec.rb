# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::ServicesController do
  describe 'GET index' do

  end

  describe 'POST :create' do
    let(:params) { { music_download_service: attributes_for(:music_download_service) } }
    let(:action) { post :create, format: :json, params: params }

    it 'creates a new ExternalService' do
      expect { action }.to change { ExternalService.count }.by(1)
    end
  end
end
