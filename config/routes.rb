# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'pages#home'

  mount Sidekiq::Web => '/sidekiq'

  resources :external_services, only: [:index, :create] do
    collection do
      get :confirm, to: 'external_services/confirmed#create'
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :music_downloads do
      resources :services, only: [:index, :create] do
        resources :artists, only: [:show] do
          collection do
            get :search

            resources :registrations, controller: :artist_registrations, only: [:index, :create, :destroy]
          end
        end

        resources :albums, only: [:index, :show] do
          collection do
            get :search

            resources :registrations, controller: :album_registrations, only: [:index, :create, :destroy]
          end

          resources :releases, controller: :album_releases, only: [:index] do
            member do
              post :choose
            end
          end
        end
      end
    end
  end
end
