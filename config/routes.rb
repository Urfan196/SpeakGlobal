Rails.application.routes.draw do
  
  resources :users
  resources :lessons
  resources :fluencies, only: [:index, :new, :create, :edit, :update, :destroy]
  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
  get "/", to: "pages#home", as: "home"
end
