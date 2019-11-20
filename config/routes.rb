Rails.application.routes.draw do

  resources :messages
  resources :conversations
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get 'users/:id' => 'users#show', as: :user

  get '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#google'
  
  resources :products do
    resources :comments, only: [:new, :create, :index]
    resources :categories, only: [:show]
  end

  resources :categories, only: [:index]

  resources :comments do
    get :like, on: :member
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  resources :users do
    resources :posts, only: [:create, :index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end