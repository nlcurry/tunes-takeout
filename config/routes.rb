Rails.application.routes.draw do
  root 'suggestions#index'

  post '/suggestions' => 'suggestions#show', as: 'search'
  resources :users,    :only => [:new, :create]
  resources :sessions, :only => [:create]


  delete "/logout" => "sessions#destroy", as: 'logout'
  get    "/auth/:provider/callback"  => "sessions#create"
  # delete "/logout" => "sessions#destroy"
  # get    "/login"  => "sessions#new"
end