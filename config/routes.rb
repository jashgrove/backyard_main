Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"

  resources :listings do
    resources :bookings, only: [:new, :create, :index]
  end

  resources :users do
    resources :bookings, only: [:index, :destroy]
  end

end
