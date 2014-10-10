Rails.application.routes.draw do
  resources :line_items
  resources :charges


  root 'pages#menu'

  get '/menu'  => 'pages#menu'
  get '/admin' => 'pages#admin'
  get '/cart'  => 'pages#cart'

  resources :users
  resources :items, only: [:index, :show]
  resources :categories
  resources :orders

  #optional if login form is on home page
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'

  get    '/logout',   to: 'sessions#destroy'


  # get    'users/:id/orders', to: 'users#orders', as: 'user_orders'
  get    'users/:id/orders', to: 'users#orders', as: 'user_orders'

  namespace :admin do
    resources :users
    resources :items
    resources :categories
  end
end
