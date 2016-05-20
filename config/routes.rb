Rails.application.routes.draw do
  root 'suggestions#index'

  post '/suggestions' => 'suggestions#show', as: 'search'
  resources :users,    :only => [:new, :create]

  delete "/logout" => "sessions#destroy", as: 'logout'
  get    "/auth/:provider/callback"  => "sessions#create"
  get    "/signin", to: "sessions#new", as: :signin
  # delete "/logout" => "sessions#destroy"
  # get    "/login"  => "sessions#new"
end