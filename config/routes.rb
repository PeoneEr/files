Files::Application.routes.draw do
  root to: 'main_page#index'

  resources :files
end
