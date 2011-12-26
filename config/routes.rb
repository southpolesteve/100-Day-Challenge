Challenge::Application.routes.draw do

  get "events/create"

  get "users/dashboard"

  devise_for :users

  root :to => "users#dashboard"

  resources :activities, :only => [:index]

end
