# frozen_string_literal: true

FactoryBot.define do
  factory :headphones_service do
    data do
      {
        host: ENV['HEADPHONES_HOST'],
        port: ENV['HEADPHONES_PORT'],
        api_key: ENV['HEADPHONES_API_KEY']
      }
    end
  end
end
