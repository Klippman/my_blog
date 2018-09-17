Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :posts
  resources :comments

  get '/' => 'home#index'

  get 'posts' => 'posts#index'
  post '/posts' => 'posts#new'


  get '/users' => 'users#index'
  get '/users/new' => 'users#new'
  

  get '/sign-in' => 'sessions#new', as: :new_session
  get '/sign-out' => 'sessions#destroy', as: :destroy_session
  post '/create-session' => 'sessions#create', as: :create_session
  
end
