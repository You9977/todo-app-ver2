Rails.application.routes.draw do  
  
  
  root to:  'tasks#index'  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get    '/signup', to: 'users#new'
  resources :tasks  
  delete 'tasks',   to: 'tasks#destroy_all'  
  resources :users
end
