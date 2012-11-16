Surfeitalpha::Application.routes.draw do

  get "pages/current"

  get '/' => 'home#index', :as => :index

  get '/sessions/login' => 'sessions#login', :as => :login
  post '/sessions/create' => 'sessions#create_surfeit'
  match 'auth/:provider/callback', to: 'sessions#create_twitter'
  get '/sessions/logout' => 'sessions#destroy', :as => :logout
  get '/sessions/fail' => 'sessions#fail', :as => :fail


  resources :users
  

    # root :to => 'Directors#index'  DO THIS
 
end


