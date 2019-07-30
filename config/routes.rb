Rails.application.routes.draw do


  get "/use",to: 'homes#use'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  root to: 'homes#home'
  resources :users
  resources :questions, only:[:index, :new, :create, :show] do
    resources :answers
  end

end
