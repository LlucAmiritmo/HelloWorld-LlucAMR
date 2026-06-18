Rails.application.routes.draw do
  root "sessions#new"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  namespace :admin do
    resources :roles
    resources :users
  end

  namespace :users do
    resources :roles, only: [:index, :show]
    resources :users, only: [:index, :show]
  end

  get "lluc/test" => "home#index"
  get "lluc/ambid/:id" => "home#index"
end