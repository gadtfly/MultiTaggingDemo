Rails.application.routes.draw do
  namespace :api do
    resources :tags, only: [:index]
  end

  resources :things, except: [:show, :new]
  root 'things#index'
end
