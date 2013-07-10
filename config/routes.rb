OfficeClassifieds::Application.routes.draw do
  devise_for :brokers 

  resources :brokers do 
    resources :favorites, only: [:index]
  end

  devise_for :renters, :controllers => { :registrations => "authentication/registrations" } 

  resources :renters do 
    resources :favorites, only: [:index]
  end

  root :to => "home#index"
  # resources :neighborhoods, only: [:index, :show]
  # resources :cities, only: [:show]
  resources :cities do
    resources :neighborhoods, only: [:index, :show] do
      resources :office_listings
    end
  end


end
