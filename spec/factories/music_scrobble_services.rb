# frozen_string_literal: true

FactoryBot.define do
  factory :music_scrobble_service do
    app MusicScrobbleService::APPS.sample
    data do
      {
        token: ENV['LASTFM_DUMMY_TOKEN']
      }
    end
  end
end
