Rails.application.routes.draw do

  root to: 'homes#home'
  get "/use",to: 'homes#use'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'favorites', to: 'favorites#index'
  post 'favorites',to: 'favorites#create'
  delete 'favorites', to: 'favorites#destroy'

  get 'matcher_list', to: 'users#matcher_list'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :posts, only: [:index, :new, :create]

  resources :questions do
    resources :answers
  end

  resources :talks, only:[:index, :new, :create]


end
