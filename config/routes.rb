Rails.application.routes.draw do
  resources :instruments do
    resources :bookings, only: :create
  end
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get "dashboards/", to: "dashboards#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
