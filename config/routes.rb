Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do 
  resources :devices, only: [:index, :create, :update]
  get '/all', to: 'devices#index'
  get '/register', to: 'devices#register'
  get '/terminate', to: 'devices#terminate'

  # resources :heartbeats, only: [:create]
  get '/alive' => "devices#createHeartbeat"

  # resources :reports, only: [:create]
  get '/report' => "devices#createReport"
  end 

end
