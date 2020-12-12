Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  namespace :api do 
  resources :devices, only: [:index, :create, :update]
  get '/all', to: 'devices#all'
  post '/register', to: 'devices#register'
  patch '/terminate', to: 'devices#terminate'

  # resources :heartbeats, only: [:create]
  post '/alive' => "devices#create_heartbeat"

  # resources :reports, only: [:create]
  post '/report' => "devices#create_report"
  end 

end
