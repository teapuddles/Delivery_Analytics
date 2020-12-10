Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :devices, only: [:create, :update]
  get 'api/all', to: 'devices#index'
  post 'api/register', to: 'device#create'
  patch 'api/terminate', to: 'device#update'

  # resources :heartbeats, only: [:create]
  post 'api/alive' => "device#createHeartbeat" 

  # resources :reports, only: [:create]
  post 'api/report' => "device#createReport"
  
end
