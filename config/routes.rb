Rails.application.routes.draw do

  get "/use",to: 'homes#use'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: 'homes#home'
  resources :users
end
