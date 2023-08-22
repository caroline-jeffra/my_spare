Rails.application.routes.draw do
  resources :instruments do
    resources :bookings, only: %i[create]
  end
  devise_for :users
  root to: "pages#home"

  get "/dashboard", to: "dashboards#show"

  resources :bookings, only: %i[destroy]
end
