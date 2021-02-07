Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # GET /about
  get "about", to: "about#index"

  # GET root
 # get "/", to: 'main#index'
  root to:"main#index"
end
