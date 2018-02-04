# frozen_string_literal: true

FactoryBot.define do
  factory :rescue_time_service do
    data { {} }

    trait :confirmed do
      data do
        {
          api_key: ENV['RESCUE_TIME_DUMMY_API_KEY']
        }
      end
    end
  end
end
