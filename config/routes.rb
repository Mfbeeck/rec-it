Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    resources :movies
  end

  resources :movies do
    resources :mov_ratings
  end

  resources :mov_ratings


  resources :sessions, only: [ :new, :create, :destroy ]
  get 'login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
