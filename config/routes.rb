Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :movies, only: [:index, :new, :create]
  resources :user_movies, only: [:create, :update]

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  get '/import_movies_form', to: 'movies#import_form', as: 'import_movies_form'
  post '/import_movies', to: 'movies#import', as: 'import_movies'

  get '/submit_ratings_form', to: 'movies#submit_ratings_form', as: 'submit_ratings_form'
  post '/submit_ratings', to: 'movies#submit_ratings', as: 'submit_ratings'
  
  root 'sessions#new'
end
