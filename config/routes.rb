OfficeClassifieds::Application.routes.draw do
  devise_for :brokers
  devise_for :renters, :controllers => { :registrations => "authentication/registrations" }
  root :to => "home#index"
  # resources :neighborhoods, only: [:index, :show]
  # resources :cities, only: [:show]
  resources :cities do
    resources :neighborhoods, only: [:index, :show] do
      resources :office_listings
    end
  end
end
