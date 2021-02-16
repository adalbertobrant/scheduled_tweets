Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # GET /about
  get "about", to: "about#index"

  # GET /sign-up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  # terms of service to access application 
  get "termsofservice", to:"terms_of_service#new"

  # omni auth callback
  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  # generate crud for twitter_accounts
  resources :twitter_accounts

  #generate crud for users tweets
  resources :tweets


  # GET root
 # get "/", to: 'main#index'
  root to:"main#index"


end
