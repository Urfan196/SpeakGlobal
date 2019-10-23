Rails.application.routes.draw do
  resources :users
  resources :lessons
  resources :fluencies, only: [:new, :create, :edit, :update]
  get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "sessions", to: "sessions#destroy"
end
