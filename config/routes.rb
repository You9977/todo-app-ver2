Rails.application.routes.draw do  
  root to:  'sessions#new'  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get    '/signup', to: 'users#new'
  post   '/users',  to: 'users#create'
  resources :tasks  
  delete 'tasks',   to: 'tasks#destroy_all'    
end
