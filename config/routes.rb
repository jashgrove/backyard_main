Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :listings do
    resources :bookings, only: [:new, :create, :index]
  end

  resources :users do
    resources :bookings, only: [:index, :destroy]
  end

  get '/my_bookings', to: 'bookings#index', as: 'my_bookings'

end
