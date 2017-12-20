# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :music_downloads do
      resources :services, only: [:new, :create]
    end
  end
end
