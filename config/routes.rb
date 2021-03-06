# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'goods#index'

  resources :goods, only: %i[new create index] do
    collection do
      get :massive_import
      post :import
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
end
