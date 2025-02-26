Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"

  resources :listings do
    resources :bookings, only: [:new, :create, :index]
    resources :listing_reviews, only: :create
  end

  resources :users do
    resources :bookings, only: [:index, :destroy]
  end

  get '/my_bookings', to: 'bookings#index', as: 'my_bookings'

  get '/my_bookings/pending', to: 'bookings#pending', as: "my_bookings_pending"

  get '/my_bookings/:id/approve', to: 'bookings#approve', as: 'my_bookings_approve'

  get '/my_bookings/:id/deny', to: 'bookings#deny', as: 'my_bookings_deny'

end
