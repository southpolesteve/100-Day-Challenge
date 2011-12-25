Challenge::Application.routes.draw do
  get "activities/index"

  get "users/dashboard"

  devise_for :users

  root :to => "users#dashboard"
end
