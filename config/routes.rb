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
  resources :cities
  resources :neighborhoods
  resources :office_listings, only: [:index, :show, :create, :edit]
  resources :viewings, only: [:index, :show, :create, :edit]

  resources :neighborhoods do 
    resources :office_listings, only: [:new]
    get 'add_listing', to: 'neighborhoods#add_listing', :as => 'neighborhood_add_listing'
  end

  resources :office_listings do
    resources :viewings, only: [:new]
  end

  resources :images, only: [:create]


end
