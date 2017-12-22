# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::MusicDownloads::ServicesController do
  describe 'GET index' do

  end

  describe 'POST :create' do
    let(:params) do
      {
        music_download_service: {
          name: 'Headphones',
          label: 'Headphones',
          data: {
            host: ENV['HEADPHONES_HOST'],
            port: ENV['HEADPHONES_PORT'],
            http_root: ENV['HEADPHONES_HTTP_ROOT'],
            api_key: ENV['HEADPHONES_API_KEY']
          }
        }
      }
    end
    let(:action) { post :create, format: :json, params: params }

    it 'creates a new ExternalService' do
      expect { action }.to change { ExternalService.count }.by(1)
    end
  end
end
