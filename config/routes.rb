OfficeClassifieds::Application.routes.draw do
  devise_for :brokers 

  resources :brokers do 
    resources :favorites, only: [:index]
    get 'brokers_listings', to: 'office_listings#brokers_listings', :as => 'brokers_listings'
  end

  devise_for :renters, :controllers => { :registrations => "authentication/registrations" } 

  resources :renters do 
    resources :favorites, only: [:index, :new, :create, :destroy]
    resources :appointments, only: [:index, :create, :destroy]
  end

  match 'renters/:renter_id/preference_lists/configure_preference_list', to: 'preference_lists#configure_preference_list', via: :get, as: 'preference_list_configure'
  match 'renters/:renter_id/preference_lists/add_neighborhood', to: 'preference_lists#add_neighborhood', via: :patch, as: 'preference_list_add_neighborhood'
  match 'renters/:renter_id/preference_lists/add_broker', to: 'preference_lists#add_broker', via: :patch, as: 'preference_list_add_broker'
  match 'renters/:renter_id/preference_lists/add_amenity', to: 'preference_lists#add_amenity', via: :patch, as: 'preference_list_add_amenity'
  match 'renters/:renter_id/preference_lists/:id/delete', to: 'preference_lists#destroy', via: :delete, as: 'preference_list_delete'
  match 'renters/:renter_id/preference_lists/create', to: 'preference_lists#create', via: :post, as: 'preference_list_create'

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

  # Notifications Paths
  resources :notifications, only: [:update]
end
