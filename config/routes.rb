Rails.application.routes.draw do
  resources :users,    :only => [:new, :create]
  resources :sessions, :only => [:create]
  delete "/logout" => "sessions#destroy"
  get    "/auth/:provider/callback"  => "sessions#create"
  # delete "/logout" => "sessions#destroy"
  # get    "/login"  => "sessions#new"
end