Rails.application.routes.draw do
  resources :movie_people
  resources :people do 
    resources :movies
  end
  resources :movies
  resources :user_movies do
    resources :movies, only: [:index]
  end
  resources :users do
    resources :movies, as: :collection
    resources :user_movies
    resources :people, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root 'sessions#home'
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth', as: :google_signin
  get 'auth/failure', to: redirect('/')
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/users/:user_id/user_movies/:id/new', to:'user_movies#new', as: :new_lotr
  get 'rating', to: 'movies#rating'
end
