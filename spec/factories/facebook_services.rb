# frozen_string_literal: true

FactoryBot.define do
  factory :facebook_service do
    data { {} }

    trait :confirmed do
      data do
        {
          access_token: ENV['FACEBOOK_DUMMY_ACCESS_TOKEN'],
          access_token_expires_on: '2200-03-30T06:20:10.624Z'
        }
      end
    end
  end
end
