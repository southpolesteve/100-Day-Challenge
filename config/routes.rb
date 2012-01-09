Challenge::Application.routes.draw do

  get "users/dashboard"
  resources :users, :only => [:show]

  devise_for :users

  root :to => "users#dashboard"

  resources :activities, :only => [:index]
  resources :events, :only => [:create]

end
