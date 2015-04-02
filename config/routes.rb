Files::Application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'main_page#index'

  devise_for :users

  namespace :my do
    resources :files do
      get :new_film, on: :collection
      post :create_film, on: :collection

      get :new_serial, on: :collection
      post :create_serial, on: :collection
    end
  end
end
