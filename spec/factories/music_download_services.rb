# frozen_string_literal: true

FactoryBot.define do
  factory :music_download_service do
    app MusicDownloadService::APPS.sample
    data do
      {
        host: ENV['HEADPHONES_HOST'],
        port: ENV['HEADPHONES_PORT'],
        api_key: ENV['HEADPHONES_API_KEY']
      }
    end
  end
end
