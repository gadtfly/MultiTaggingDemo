Rails.application.routes.draw do
  resources :things, except: [:show, :new]
  root 'things#index'
end
