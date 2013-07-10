OfficeClassifieds::Application.routes.draw do
  devise_for :brokers
  devise_for :renters
  root :to => "home#index"
  # resources :neighborhoods, only: [:index, :show]
  # resources :cities, only: [:show]
  resources :cities do
    resources :neighborhoods, only: [:index, :show]
  end
end
