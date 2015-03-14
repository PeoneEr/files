Files::Application.routes.draw do
  root to: 'main_page#index'

  resources :files
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
