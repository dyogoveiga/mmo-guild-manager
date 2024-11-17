Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  #get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  #get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get "/users", to: "dashboards#index"
  get "/users/dashboard", to: "dashboards#index"
  get "/users/wallet", to: "wallets#index"
  get "/users/auction", to: "auctions#index"
  get "/users/auction/offer", to: "auctions#offer"
  get "/signup", to: "signups#index"
  match '/users/auth/:provider/callback', to: 'users/omniauth_callbacks#discord', via: [:get, :post]


  # Defines the root path route ("/")
  root to: "signins#index"
end
