# frozen_string_literal: true

FactoryBot.define do
  factory :moves_service do
    data { {} }

    trait :confirmed do
      data do
        {
          access_token: ENV['MOVES_DUMMY_ACCESS_TOKEN'],
          refresh_token: ENV['MOVES_DUMMY_REFRESH_TOKEN']
        }
      end
    end
  end
end
