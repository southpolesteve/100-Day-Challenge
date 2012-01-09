Challenge::Application.routes.draw do

  get "users/dashboard"
  get "users/:id/events" => "users#events", :as => "user_events"

  devise_for :users

  root :to => "users#dashboard"

  resources :activities, :only => [:index]
  resources :events, :only => [:create, :delete]

end
