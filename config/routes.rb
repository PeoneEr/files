Files::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'main_page#index'
  post '/' => 'main_page#index'

  devise_for :users

  namespace :my do
    root to: 'files#index'

    resources :files do
      get :new_film, on: :collection
      post :create_film, on: :collection

      get :start_watching, on: :collection

      get :new_serial, on: :collection
      post :create_serial, on: :collection
    end
  end
end
