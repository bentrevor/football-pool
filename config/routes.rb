Rails.application.routes.draw do
  resources :games, only: [:show]
  resources :weeks, only: [:show, :index]
end
