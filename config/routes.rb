Challenge::Application.routes.draw do

  get "users/dashboard"

  devise_for :users

  root :to => "users#dashboard"

  resources :activities, :only => [:index]
  resources :events, :only => [:create]

end
