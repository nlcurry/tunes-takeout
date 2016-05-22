Rails.application.routes.draw do
  root 'suggestions#index'

  resources :users,    :only => [:new, :create]

  delete "/logout" => "sessions#destroy", as: 'logout'
  get    "/auth/:provider/callback"  => "sessions#create"
  get    "/signin", to: "sessions#new", as: :signin
  post   "/" => "suggestions#index"
  get    "/myfavorites" => "suggestions#myfavorites"
  # delete "/logout" => "sessions#destroy"
  # get    "/login"  => "sessions#new"
end