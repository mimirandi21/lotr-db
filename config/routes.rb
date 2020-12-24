Rails.application.routes.draw do
  resources :movie_people
  resources :people
  resources :movies
  resources :user_movies do
    resources :movies, only: [:index]
  end
  resources :users do
    resources :movies, :as => :user_collection
    resources :user_movies
    resources :people, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root 'users#home'
  get '/auth/:provider/callback', to: 'users#omniauth'
  get 'auth/failure', to: redirect('/')
  get '/users/signin', to: 'users#signin'
  post '/users/signin', to: 'users#login'
  get '/user/logout', to: 'users#logout'
  get 'users/:user_id/movies/choose', to: 'movies#choose', as: :choose
  get 'users/:user_id/movies/find', to: 'movies#find', as: :find
  post 'users/:user_id/movies/find', to: 'movies#create'
  post 'users/:user_id/movies/choose', to: 'movies#create_from_db', as: :dbcreate

  
end
