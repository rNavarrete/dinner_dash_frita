Rails.application.routes.draw do
  root 'welcome#index'
  get '/' => 'welcome#index'

  resources :users

  #optional if login button is on home page
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
