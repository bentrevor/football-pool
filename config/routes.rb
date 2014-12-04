Rails.application.routes.draw do
  resources :games, only: [:show]
  resources :weeks, only: [:show, :index]

  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
end
