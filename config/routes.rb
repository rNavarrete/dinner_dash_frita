Rails.application.routes.draw do
  root 'pages#index'
  get '/' => 'pages#index'
  get '/menu' => 'pages#menu'

  resources :users
  resources :items
  resources :categories

  #optional if login form is on home page
  get    '/login',    to: 'sessions#new'

  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'

  get    'users/:id/orders', to: 'users#orders', as: 'user_orders'

  namespace :admin do
    resources :users
  end


end
