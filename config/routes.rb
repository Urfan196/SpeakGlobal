Rails.application.routes.draw do
  
  resources :convos
  resources :users
  resources :lessons
  resources :fluencies, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :convos, only: [:index, :new, :create]
  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "sessions", to: "sessions#destroy", as: "logout"
  get "/", to: "pages#home", as: "home"
end
