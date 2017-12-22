# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  namespace :api, defaults: { format: :json } do
    namespace :music_downloads do
      resources :services, only: [:index, :create] do
        resources :artists, only: [:index, :show, :create] do
          collection do
            get :search
          end
        end
        resources :albums, only: [:index, :show, :create]
      end
    end
  end
end
