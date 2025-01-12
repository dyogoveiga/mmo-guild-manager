Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :characters, only: [ :new, :create ]


  # get "/users", to: "dashboards#index"
  get "/users/auction", to: "auctions#index"
  get "/users/wallet", to: "wallets#index"
  get "/users/auction/offer", to: "auctions#offer"

  get "/dashboard", to: "dashboards#show"
  get "/users/auth/:provider/callback", to: "users/omniauth_callbacks#discord"

  root to: "signins#show"

  namespace :admin do
    resources :characters

    get "/", to: "dashboards#show"
  end
end
