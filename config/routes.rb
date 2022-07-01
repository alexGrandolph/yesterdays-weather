Rails.application.routes.draw do

  root "welcome#index"
  get '/dashboard', to: "users#show"


  get '/locations/new', to: "locations#new"
  post '/locations', to: "locations#create"

  get '/register', to: "users#new"
  post '/register', to: "users#create"
end
