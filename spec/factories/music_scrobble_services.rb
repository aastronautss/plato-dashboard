# frozen_string_literal: true

FactoryBot.define do
  factory :music_scrobble_service do
    data do
      {
        token: ENV['LASTFM_DUMMY_TOKEN']
      }
    end
  end
end
