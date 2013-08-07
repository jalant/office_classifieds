OfficeClassifieds::Application.routes.draw do
  devise_for :brokers 

  resources :brokers do 
    resources :favorites, only: [:index]
    resources :office_listings, only: [:brokers_listings]
  end

  devise_for :renters, :controllers => { :registrations => "authentication/registrations" } 

  resources :renters do 
    resources :favorites, only: [:index, :new, :create, :destroy]
    resources :appointments, only: [:create, :destroy]
  end

  root :to => "home#index"

  # Neighborhoods Paths
  resources :cities, only: [:show] do
    resources :neighborhoods, only: [:index, :show]
  end

  resources :neighborhoods do
    collection do
      get 'add_listing', to: 'neighborhoods#add_listing', :as => 'neighborhood_add_listing'
    end
  end

  # Office Listings Paths
  resources :neighborhoods, only: [:show] do
    resources :office_listings, only: [:index, :show, :new, :create, :edit]
  end

  # Viewings Paths
  resources :office_listings, only: [:show] do 
    resources :viewings, only: [:new, :create, :destroy, :index]
  end
  resources :images, only: [:create]
end
