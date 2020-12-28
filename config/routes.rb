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


  root 'users#home'
  get '/auth/:provider/callback', to: 'users#omniauth', as: :google_signin
  get 'auth/failure', to: redirect('/')
  get '/users/signin', to: 'users#signin'
  post '/users/signin', to: 'users#login'
  get '/user/logout', to: 'users#logout'
  get '/users/:user_id/user_movies/:id/new', to:'user_movies#new', as: :new_lotr
  
end
