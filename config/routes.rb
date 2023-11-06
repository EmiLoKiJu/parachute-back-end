Rails.application.routes.draw do
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get 'auto_login', to: 'users#auto_login'
  resources :parachutes, only: [:index, :show, :create, :update, :destroy]
  resources :reservations, only: [:index, :show, :create, :destroy]
end
