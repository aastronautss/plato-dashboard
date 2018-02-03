# frozen_string_literal: true

FactoryBot.define do
  factory :last_fm_service do
    data { {} }

    trait :confirmed do
      data do
        {
          session: ENV['LASTFM_DUMMY_TOKEN'],
          username: ENV['LASTFM_DUMMY_USERNAME']
        }
      end
    end
  end
end
