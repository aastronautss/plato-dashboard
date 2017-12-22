# frozen_string_literal: true

FactoryBot.define do
  factory :music_download_service do
    name 'Headphones'
    data({
      host: ENV['HEADPHONES_HOST'],
      port: ENV['HEADPHONES_PORT'],
      http_root: ENV['HEADPHONES_HTTP_ROOT'],
      api_key: ENV['HEADPHONES_API_KEY']
    })
  end
end
