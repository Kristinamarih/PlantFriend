Rails.application.routes.draw do

  get '/signup' => 'users#new'
  
  resources :categories
  resources :comments
  resources :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
