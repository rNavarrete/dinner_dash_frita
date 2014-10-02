Rails.application.routes.draw do
  root 'pages#menu'

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
    get  '/users',          to: 'users#index',  as: 'all_users'
    # get  '/users/:id',      to: 'users#show',   as: 'show_user'
    get  '/users/:id/edit', to: 'users#edit',   as: 'edit_user'
    # post '/users/:id/edit', to: 'users#update', as: ''

    # resources :users
    resources :menus
  end

end
