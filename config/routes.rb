Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :characters, only: [ :new, :create ]


  # get "/users", to: "dashboards#index"
  get "/users/auction", to: "auctions#index"
  get "/users/wallet", to: "wallets#index"
  get "/users/auction/offer", to: "auctions#offer"

  get "/dashboard", to: "dashboards#show"
  get "/users/auth/:provider/callback", to: "users/omniauth_callbacks#discord"

  root to: "signins#new"

  resources :dynamic_event_participations, only: [ :index, :new, :create ]

  namespace :admin do
    resources :characters do
      resources :gear_score_histories, module: :characters
      resources :reputation_histories, module: :characters
    end

    resources :weekly_character_info_reports

    get "/", to: "dashboards#show"
  end
end
